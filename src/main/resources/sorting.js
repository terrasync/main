function sortTable(table, col, reverse) {
	var className = table.tHead.rows[0].cells[col].className;
    var tb = table.tBodies[0];
    var tr = Array.prototype.slice.call(tb.rows, 0);
    var i;
    reverse = -((+reverse) || -1);
    tr = tr.sort(function (a, b) {
		if( className == "alpha" ) {
			return reverse // -1 * if want opposite order
				* (a.cells[col].textContent.trim() // using .textContent.trim() for test
					.localeCompare(b.cells[col].textContent.trim())
				   );			
		} else {
			var valA = a.cells[col]?a.cells[col].textContent.trim():"0";
			var valB = b.cells[col]?b.cells[col].textContent.trim():"0";
			return reverse // -1 * if want opposite order
				* (valA.localeCompare(valB, undefined, {numeric: true}));						
		}
    });
    for(i = 0; i < tr.length; ++i) tb.appendChild(tr[i]); // append each row in order
}
function makeSortable(table) {
    var th = table.tHead, i;
    th && (th = th.rows[0]) && (th = th.cells);
    if (th) { 
	  i = th.length;
	}
    else return; // if no <thead> then do nothing
    while (--i >= 0) (function (i) {
        var dir = 1;
        th[i].addEventListener('click', function () {sortTable(table, i, (dir = 1 - dir))});
    }(i));
}
function makeAllSortable(parent) {
    parent = parent || document.body;
    var t = parent.getElementsByTagName('table'), i = t.length;
    while (--i >= 0) makeSortable(t[i]);
}
window.onload = function () {makeAllSortable();};