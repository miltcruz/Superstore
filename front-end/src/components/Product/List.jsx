import { useEffect, useState } from "react";
import { read } from "../../api/fetch-wrapper";

export default function ProductList() {
    const [products, setProducts] = useState([]);
    const [error, setError] = useState(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const fetchProducts = async () => {
            setLoading(true);
            try {
                const data = await read("products");
                setProducts(data);
            } catch (err) {
                setError(err.message);
            } finally {
                setLoading(false);
            }
        };

        fetchProducts();
    }, []);

    if (loading) return <div>Loading...</div>;
    if (error) return <div>Error: {error}</div>;
    if (products.length === 0) return <div>No products found.</div>;

    return (
        <div>
            <h2>Products</h2>
            <ul>
                {products.map((product) => (
                    <li key={product.productID}>
                        {product.productName} - ${product.unitPrice.toFixed(2)}, Category: {product.category}, Sub-Category: {product.subCategory}
                    </li>
                ))}
            </ul>
        </div>
    );
}
