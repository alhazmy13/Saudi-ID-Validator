'use strict';
/**
 * @return {number}
 */
function validateSAID(id) {
  let type = id.substr(0, 1);
  let sum = 0;
  const _idLength = 10;
  const _type1 = '1';
  const _type2 = '2';
  id = id.trim();
  if (isNaN(parseInt(id)) || (id.length !== _idLength) || (type !== _type2 && type !== _type1)) {
    return -1;
  }
  for (let num = 0; num < 10; num++) {
    const digit = Number(id[num]);
    if (num % 2 === 0) {
      const doubled = digit * 2;
      const ZFOdd = `00${doubled}`.slice(-2);
      sum += Number(ZFOdd[0]) + Number(ZFOdd[1]);
    } else {
      sum += digit;
    }

  }
  return (sum % 10 !== 0) ? -1 : type;
}
