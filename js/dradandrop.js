const rows = 6;
const cols = 7;
let currentPlayer = "red";
const board = Array(rows).fill(null).map(() => Array(cols).fill(null));

// Crear tablero
const boardElement = document.getElementById("board");
for (let row = 0; row < rows; row++) {
    for (let col = 0; col < cols; col++) {
        const cell = document.createElement("div");
        cell.classList.add("cell");
        cell.dataset.row = row;
        cell.dataset.col = col;
        boardElement.appendChild(cell);
    }
}

// Funcionalidad Drag & Drop
const pieces = document.querySelectorAll(".piece-container");
pieces.forEach(piece => {
    piece.addEventListener("dragstart", (event) => {
        event.dataTransfer.setData("color", piece.id.includes("red") ? "red" : "yellow");
    });
});

const cells = document.querySelectorAll(".cell");
cells.forEach(cell => {
    cell.addEventListener("dragover", (event) => event.preventDefault());
    cell.addEventListener("drop", (event) => {
        const color = event.dataTransfer.getData("color");
        const col = parseInt(cell.dataset.col);

        // Encontrar la posición más baja disponible en la columna
        let rowToFill = null;
        for (let row = rows - 1; row >= 0; row--) {
            if (!board[row][col]) {
                rowToFill = row;
                break;
            }
        }

        if (rowToFill !== null) {
            // Actualizar el tablero lógico
            board[rowToFill][col] = color;

            // Buscar la celda correcta para el elemento en la interfaz
            const targetCell = [...cells].find(
                c => parseInt(c.dataset.row) === rowToFill && parseInt(c.dataset.col) === col
            );

            if (targetCell) {
                // Actualizar el tablero visual
                targetCell.classList.add("filled");
                const piece = document.createElement("div");
                piece.classList.add("piece", color);
                targetCell.appendChild(piece);

                // Cambiar de jugador
                currentPlayer = currentPlayer === "red" ? "yellow" : "red";

                // Verificar si hay ganador
                if (checkWinner(rowToFill, col, color)) {
                    setTimeout(() => alert(`${color.toUpperCase()} ha ganado!`), 100);
                }
            }
        }
    });
});

// Verificar ganador
function checkWinner(row, col, color) {
    // Direcciones para verificar (horizontal, vertical, diagonales)
    const directions = [
        { dr: 0, dc: 1 }, // Horizontal
        { dr: 1, dc: 0 }, // Vertical
        { dr: 1, dc: 1 }, // Diagonal abajo derecha
        { dr: 1, dc: -1 } // Diagonal abajo izquierda
    ];

    for (let { dr, dc } of directions) {
        let count = 1;

        // Verificar en una dirección
        for (let i = 1; i < 4; i++) {
            const r = row + dr * i;
            const c = col + dc * i;
            if (r < 0 || r >= rows || c < 0 || c >= cols || board[r][c] !== color) break;
            count++;
        }

        // Verificar en la dirección opuesta
        for (let i = 1; i < 4; i++) {
            const r = row - dr * i;
            const c = col - dc * i;
            if (r < 0 || r >= rows || c < 0 || c >= cols || board[r][c] !== color) break;
            count++;
        }

        if (count >= 4) return true;
    }

    return false;
}