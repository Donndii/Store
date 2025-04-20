fetch("get_products.php")
  .then(res => res.json())
  .then(data => {
    const categoryMap = {
      "Books": document.getElementById("product-container-books"),
      "Food": document.getElementById("product-container-food"),
      "Clothes": document.getElementById("product-container-clothes"),
      "Electronics": document.getElementById("product-container-electronics"),
      "Decoration": document.getElementById("product-container-decoration"),
      "Furniture": document.getElementById("product-container-furniture")
    };

    data.forEach(product => {
      const container = categoryMap[product.product_type.trim()];
      if (!container) return; // Skip if category not in map

      const html = `
        <div class="text-two">
          <div class="outer-con">
            <div class="title">${product.product_name}</div>
            <div class="sub-title">¥${parseFloat(product.product_price).toFixed(2)}</div>
          </div>
          <a href="shopInfo-1.html?id=${product.id}">
            <img src="${product.product_img}" alt="${product.product_name}"
              onerror="this.onerror=null; this.src='images/default.jpg';">
          </a>
        </div>
      `;
      container.insertAdjacentHTML("beforeend", html);
    });
  })
  .catch(err => {
    console.error("Loading error:", err);
  });


