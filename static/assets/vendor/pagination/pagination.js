// static/assets/vendor/pagination/pagination.js

class Paginator {
    constructor(tableId, paginationId, options = {}) {
        this.table = document.getElementById(tableId);
        this.pagination = document.getElementById(paginationId);
        this.itemsPerPage = options.itemsPerPage || 5;
        this.currentPage = 1;
        this.rows = this.table.querySelectorAll('tbody tr');
        this.totalPages = Math.ceil(this.rows.length / this.itemsPerPage);

        this.initialize();
    }

    initialize() {
        this.displayPage(this.currentPage);
        this.setupPagination();
    }

    displayPage(page) {
        this.currentPage = page;
        const start = (page - 1) * this.itemsPerPage;
        const end = start + this.itemsPerPage;

        this.rows.forEach((row, index) => {
            row.style.display = (index >= start && index < end) ? '' : 'none';
        });

        this.updatePagination();
    }

    createPageItem(page, text, isDisabled = false) {
        const li = document.createElement('li');
        li.className = `page-item ${this.currentPage === page ? 'active' : ''} ${isDisabled ? 'disabled' : ''}`;
        
        const link = document.createElement('a');
        link.className = 'page-link';
        link.href = '#';
        if (!isDisabled) link.dataset.page = page;
        link.textContent = text;

        li.appendChild(link);
        return li;
    }

    updatePagination() {
        this.pagination.innerHTML = '';
        const pageNumbers = [];

        // Generate page numbers with ellipsis logic
        for (let i = 1; i <= this.totalPages; i++) {
            if (i === 1 || i === this.totalPages || (i >= this.currentPage - 2 && i <= this.currentPage + 2)) {
                pageNumbers.push(i);
            }
        }

        // Add "First" and "Previous" buttons
        if (this.currentPage > 1) {
            this.pagination.appendChild(this.createPageItem(1, 'First'));
            this.pagination.appendChild(this.createPageItem(this.currentPage - 1, 'Previous'));
        }

        // Add page numbers with ellipsis
        pageNumbers.forEach((num, index) => {
            if (index > 0 && num - pageNumbers[index - 1] > 1) {
                this.pagination.appendChild(this.createPageItem(null, '...', true));
            }
            this.pagination.appendChild(this.createPageItem(num, num));
        });

        // Add "Next" and "Last" buttons
        if (this.currentPage < this.totalPages) {
            this.pagination.appendChild(this.createPageItem(this.currentPage + 1, 'Next'));
            this.pagination.appendChild(this.createPageItem(this.totalPages, 'Last'));
        }
    }

    setupPagination() {
        this.pagination.addEventListener('click', (e) => {
            e.preventDefault();
            const target = e.target.closest('.page-link:not(.disabled)');
            if (!target) return;

            const page = parseInt(target.dataset.page);
            if (!isNaN(page)) this.displayPage(page);
        });
    }
}