document.addEventListener('DOMContentLoaded', () => {
    const modal = document.getElementById('newItemModal');
    const closeButton = document.getElementById('closeButton');
    const addNewItemButton = document.getElementById('addItemButton');


    if (closeButton && modal) {
        closeButton.addEventListener('click', () => {
            modal.style.display = 'none';
        });

        addNewItemButton.addEventListener('click', () => {
            modal.style.display = 'flex';
        })

        window.addEventListener('click', (event) => {
            if (event.target == modal) {
                modal.style.display = 'none';
            }
        });
    }
});
