// function initializeModels() {
//     // Function to open modal
//     function openModal(modal) {
//         modal.style.display = 'flex';
//     }

//     // Function to close modal
//     function closeModal(modal) {
//         modal.style.display = 'none';
//     }

//     const newItemModal = document.getElementById('newItemModal');
//     const editItemModal = document.getElementById('editItemModal');
//     const addNewItemButton = document.getElementById('addItemButton');
//     const editItemButtons = document.querySelectorAll('.edit-item-button');
//     const closeButtons = document.querySelectorAll('.close-button');

//     // Close modal functionality
//     closeButtons.forEach(button => {
//         button.addEventListener('click', () => {
//             closeModal(newItemModal);
//             closeModal(editItemModal);
//         });
//     });

//     // Open new item modal
//     addNewItemButton.addEventListener('click', () => {
//         openModal(newItemModal);
//     });

//     // Open edit item modal and populate form
//     editItemButtons.forEach(button => {
//         button.addEventListener('click', (event) => {
//             event.preventDefault(); // Prevent default button behavior

//             // Get item data from button data attributes
//             const itemId = button.dataset.itemId;
//             const itemName = button.dataset.itemName;
//             const itemPrice = button.dataset.itemPrice;
//             const itemDescription = button.dataset.itemDescription;

//             // Get the form in the edit modal
//             const editForm = editItemModal.querySelector('form');

//             // Set the form's action URL and method
//             editForm.action = `/admin/items/${itemId}`; // Update the action to the correct URL
//             editForm.method = 'post'; // Use POST method to work with Rails
//             const methodInput = document.createElement('input'); // Add a hidden input for PATCH method
//             methodInput.type = 'hidden';
//             methodInput.name = '_method';
//             methodInput.value = 'patch';
//             editForm.appendChild(methodInput);

//             // Set the form fields with the item's current data
//             editForm.querySelector('input[name="item[item_name]"]').value = itemName;
//             editForm.querySelector('input[name="item[item_description]"]').value = itemDescription;
//             editForm.querySelector('input[name="item[price]"]').value = itemPrice;

//             // Open the edit item modal
//             openModal(editItemModal);
//         });
//     });

//     // Close modal when clicking outside of the modal content
//     window.addEventListener('click', (event) => {
//         if (event.target == newItemModal) {
//             closeModal(newItemModal);
//         }
//         if (event.target == editItemModal) {
//             closeModal(editItemModal);
//         }
//     });
// }


// document.addEventListener('DOMContentLoaded', initializeModels);

