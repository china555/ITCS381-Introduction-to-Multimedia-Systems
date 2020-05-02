const num = [12, 17, 33, 37, 19, 18, 28, 8, 25, 33, 15, 11, 13, 22, 24, 17, 11, 11, 21, 27, 20, 10, 14, 26, 27]
// const num = [1, 2, 3, 4, 5, 6, 7, 8, 9]

const energy = []
const M_matrix = []
let x = 0,
  y = 0; //          1 1 2 3 3 
// 1 2 3             1 1 2 3 3
// 4 5 6             4 4 5 6 6
// 7 8 9             7 7 8 9 9
//                   7 7 8 9 9
const n = 5
let width = n;
let height = n;
for (let i = 0; i <= width * height; i++) {
  if (x == width) {
    x = 0;
    y++;
  }

  if (y == 0) { //first row
    if (x == 0) { // first row first column
      energy.push(calculate_energy(num[getPosition_y(x, y)], num[getPosition_y(x + 1, y)], num[getPosition_y(x, y)], num[getPosition_y(x, y + 1)]))
    } else if (x == width - 1) { // first row right edge
      energy.push(calculate_energy(num[getPosition_y(x - 1, y)], num[getPosition_y(x, y)], num[getPosition_y(x, y)], num[getPosition_y(x, y + 1)]))
    } else { // first row middle cells
      energy.push(calculate_energy(num[getPosition_y(x - 1, y)], num[getPosition_y(x + 1, y)], num[getPosition_y(x, y)], num[getPosition_y(x, y + 1)]))
    }
  } else if (y == height - 1) { // last row 
    if (x == 0) { // left edge
      energy.push(calculate_energy(num[getPosition_y(x, y)], num[getPosition_y(x + 1, y)], num[getPosition_y(x, y)], num[getPosition_y(x, y - 1)]))
    } else if (x == width - 1) { // right edge
      energy.push(calculate_energy(num[getPosition_y(x - 1, y)], num[getPosition_y(x, y)], num[getPosition_y(x, y)], num[getPosition_y(x, y - 1)]))
    } else { // middle
      energy.push(calculate_energy(num[getPosition_y(x - 1, y)], num[getPosition_y(x + 1, y)], num[getPosition_y(x, y)], num[getPosition_y(x, y - 1)]))
    }
  } else { // middle row
    if (x == 0) { // left edge
      energy.push(calculate_energy(num[getPosition_y(x, y)], num[getPosition_y(x + 1, y)], num[getPosition_y(x, y + 1)], num[getPosition_y(x, y - 1)]))
    } else if (x == width - 1) { // right edge
      energy.push(calculate_energy(num[getPosition_y(x - 1, y)], num[getPosition_y(x, y)], num[getPosition_y(x, y + 1)], num[getPosition_y(x, y - 1)]))
    } else {
      energy.push(calculate_energy(num[getPosition_y(x - 1, y)], num[getPosition_y(x + 1, y)], num[getPosition_y(x, y + 1)], num[getPosition_y(x, y - 1)]))
    }
  }

  x++;
}

let x_test = 0;
let y_test = 0;
for (let i = 0; i < width * height; i++) {
  if (x_test == width) {
    x_test = 0;
    y_test++;
  }
  console.log("width: " + x_test + ", height: " + y_test + ", Energy: " + energy[i]);
  x_test++;
}

x = 0;
y = 0;

for (let i = 0; i < height * width; i++) {
  if (x == width) {
    x = 0;
    y++;
  }
  if (y == 0) { // if the pixel is located in first row, the Min will be 0
    M_matrix.push(energy[i]);
  } else {
    if (x == 0) {
      // left edge
      M_matrix.push(energy[i] + Math.min(M_matrix[i - width], M_matrix[i - width + 1]));
    } else if (x == width - 1) {
      // right edge
      M_matrix.push(energy[i] + Math.min(M_matrix[i - width], M_matrix[i - width - 1]));
    } else {
      // middle cells
      M_matrix.push(energy[i] + Math.min(M_matrix[i - width - 1], M_matrix[i - width], M_matrix[i - width + 1]));
    }
  }
  x++;
}

console.log("=====================================================================")
x_test = 0;
y_test = 0;
for (let i = 0; i < width * height; i++) {
  if (x_test == width) {
    x_test = 0;
    y_test++;
  }
  console.log("width: " + x_test + ", height: " + y_test + ", M : " + M_matrix[i]);
  x_test++;
}

function getPosition_y(x, y) {
  //println(originalImage.width);
  return (y * width) + x;
}

function calculate_energy(x1, x2, y1, y2) {
  return Math.abs(x1 - x2) / 2 + Math.abs(y1 - y2) / 2;
}