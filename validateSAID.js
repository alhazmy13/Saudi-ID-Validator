'use strict';
/**
 * @return {number}
 */
function validateSAID(id) {
  
  id = id.trim();
  if (isNaN(parseInt(id))) {
    return -1;
  }
  if (id.length !== 10) {
    return -1;
  }
  var type = id.substr(0, 1);
  if (type !== '2' && type !== '1') {
    return -1;
  }
  var sum = 0;
  for (var i = 0; i < 10; i++) {
    if (i % 2 === 0) {
      var ZFOdd = String('00' + String(Number(id.substr(i, 1)) * 2)).slice(-2);
      sum += Number(ZFOdd.substr(0, 1)) + Number(ZFOdd.substr(1, 1));
    } else {
      sum += Number(id.substr(i, 1));
    }

  }
  return (sum % 10 !== 0) ? -1 : type;
}
