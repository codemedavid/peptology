import { useState, useEffect } from 'react';
import { supabase } from '../lib/supabase';
import type { Product, ProductVariation } from '../types';

export function useMenu() {
  const [products, setProducts] = useState<Product[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    fetchProducts();
  }, []);

  const fetchProducts = async () => {
    try {
      setLoading(true);
      const { data, error } = await supabase
        .from('products')
        .select('*')
        .order('featured', { ascending: false })
        .order('name', { ascending: true });

      if (error) throw error;
      
      // Fetch variations for each product
      const productsWithVariations = await Promise.all(
        (data || []).map(async (product) => {
          const { data: variations } = await supabase
            .from('product_variations')
            .select('*')
            .eq('product_id', product.id)
            .order('quantity_mg', { ascending: true });
          
          return {
            ...product,
            variations: variations || []
          };
        })
      );

      setProducts(productsWithVariations);
      setError(null);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to fetch products');
      console.error('Error fetching products:', err);
    } finally {
      setLoading(false);
    }
  };

  const addProduct = async (product: Omit<Product, 'id' | 'created_at' | 'updated_at'>) => {
    try {
      const { data, error } = await supabase
        .from('products')
        .insert([product])
        .select();

      if (error) throw error;
      
      // data is an array, get the first element
      const newProduct = data && data.length > 0 ? data[0] : null;
      
      if (newProduct) {
        // Refetch all products to ensure UI is in sync with database
        await fetchProducts();
      }
      return { success: true, data: newProduct };
    } catch (err) {
      console.error('Error adding product:', err);
      return { success: false, error: err instanceof Error ? err.message : 'Failed to add product' };
    }
  };

  const updateProduct = async (id: string, updates: Partial<Product>) => {
    try {
      console.log('=== UPDATE PRODUCT START ===');
      console.log('Product ID:', id);
      console.log('Updates being sent:', updates);
      console.log('Updates types:', Object.entries(updates).map(([k, v]) => `${k}: ${typeof v} = ${v}`));
      
      const { data, error } = await supabase
        .from('products')
        .update(updates)
        .eq('id', id)
        .select();

      if (error) {
        console.error('Supabase update error:', error);
        throw new Error(error.message || error.details || 'Unknown database error');
      }
      
      console.log('Raw data returned from Supabase:', data);
      
      // data is an array, get the first element
      const updatedProduct = data && data.length > 0 ? data[0] : null;
      
      console.log('Updated product:', updatedProduct);
      
      if (updatedProduct) {
        console.log('Fetching all products to refresh...');
        // Refetch all products to ensure UI is in sync with database
        await fetchProducts();
        console.log('Products refreshed');
      }
      
      console.log('=== UPDATE PRODUCT END ===');
      return { success: true, data: updatedProduct };
    } catch (err) {
      console.error('Error updating product:', err);
      const errorMessage = err instanceof Error ? err.message : 'Failed to update product';
      return { success: false, error: errorMessage };
    }
  };

  const deleteProduct = async (id: string) => {
    try {
      const { error } = await supabase
        .from('products')
        .delete()
        .eq('id', id);

      if (error) throw error;
      
      // Refetch all products to ensure UI is in sync with database
      await fetchProducts();
      return { success: true };
    } catch (err) {
      console.error('Error deleting product:', err);
      return { success: false, error: err instanceof Error ? err.message : 'Failed to delete product' };
    }
  };

  const addVariation = async (variation: Omit<ProductVariation, 'id' | 'created_at'>) => {
    try {
      const { data, error } = await supabase
        .from('product_variations')
        .insert([variation])
        .select()
        .single();

      if (error) throw error;
      
      // Refresh products to include new variation
      await fetchProducts();
      return { success: true, data };
    } catch (err) {
      console.error('Error adding variation:', err);
      return { success: false, error: err instanceof Error ? err.message : 'Failed to add variation' };
    }
  };

  const updateVariation = async (id: string, updates: Partial<ProductVariation>) => {
    try {
      console.log('=== UPDATE VARIATION START ===');
      console.log('Variation ID:', id);
      console.log('Updates being sent:', updates);
      
      // Remove read-only fields
      const { id: varId, created_at, product_id, ...updateData } = updates as any;
      
      // Ensure numeric fields are actually numbers
      if (updateData.price !== undefined && updateData.price !== null) {
        updateData.price = Number(updateData.price);
      }
      if (updateData.quantity_mg !== undefined && updateData.quantity_mg !== null) {
        updateData.quantity_mg = Number(updateData.quantity_mg);
      }
      if (updateData.stock_quantity !== undefined && updateData.stock_quantity !== null) {
        updateData.stock_quantity = Number(updateData.stock_quantity);
      }
      
      const { data, error } = await supabase
        .from('product_variations')
        .update(updateData)
        .eq('id', id)
        .select()
        .single();

      if (error) {
        console.error('Supabase update error:', error);
        throw new Error(error.message || 'Failed to update variation');
      }
      
      console.log('Updated variation:', data);
      
      // Refresh products to include updated variation
      await fetchProducts();
      console.log('=== UPDATE VARIATION END ===');
      return { success: true, data };
    } catch (err) {
      console.error('Error updating variation:', err);
      return { success: false, error: err instanceof Error ? err.message : 'Failed to update variation' };
    }
  };

  const deleteVariation = async (id: string) => {
    try {
      const { error } = await supabase
        .from('product_variations')
        .delete()
        .eq('id', id);

      if (error) throw error;
      
      // Refresh products to remove variation
      await fetchProducts();
      return { success: true };
    } catch (err) {
      console.error('Error deleting variation:', err);
      return { success: false, error: err instanceof Error ? err.message : 'Failed to delete variation' };
    }
  };

  return {
    menuItems: products, // Keep the same name for backward compatibility
    products,
    loading,
    error,
    refreshProducts: fetchProducts,
    addProduct,
    updateProduct,
    deleteProduct,
    addVariation,
    updateVariation,
    deleteVariation
  };
}
