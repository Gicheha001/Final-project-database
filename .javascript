// Load customers
document.getElementById('load-customers').addEventListener('click', async () => {
    const response = await fetch('/customers');
    const customers = await response.json();

    const customersList = document.getElementById('customers-list');
    customersList.innerHTML = ''; // Clear the list

    customers.forEach(customer => {
        const listItem = document.createElement('li');
        listItem.textContent = `${customer.name} (${customer.email})`;
        customersList.appendChild(listItem);
    });
});

// Load menu
document.getElementById('load-menu').addEventListener('click', async () => {
    const response = await fetch('/menu');
    const menuItems = await response.json();

    const menuList = document.getElementById('menu-list');
    menuList.innerHTML = ''; // Clear the list

    menuItems.forEach(item => {
        const listItem = document.createElement('li');
        listItem.textContent = `${item.name} - $${item.price}`;
        menuList.appendChild(listItem);
    });
});
<script>
let slideIndex = 0;

function showSlides() {
    const slides = document.querySelectorAll(".slides");
    const dots = document.querySelectorAll(".dot");
    slides.forEach(slide => slide.style.display = "none");
    dots.forEach(dot => dot.className = dot.className.replace(" active", ""));
    
    slideIndex++;
    if (slideIndex > slides.length) slideIndex = 1;
    
    slides[slideIndex - 1].style.display = "block";
    dots[slideIndex - 1].className += " active";
    
    setTimeout(showSlides, 3000); // Change slide every 3 seconds
}

showSlides();
</script>