/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


var currentPage = 1;
var pages = document.querySelectorAll('.page');

function nextPage() {
    if (currentPage < pages.length) {
        pages[currentPage - 1].style.display = 'none';
        currentPage++;
        pages[currentPage - 1].style.display = 'block';
    }
}

function prevPage() {
    if (currentPage > 1) {
        pages[currentPage - 1].style.display = 'none';
        currentPage--;
        pages[currentPage - 1].style.display = 'block';
    }
}