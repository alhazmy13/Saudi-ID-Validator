export function validateSAID(id: string) {
  
  id = id.trim();
  if (Number(id) === null) {
    return -1;
  }
  if (id.length !== 10) {
    return -1;
  }
  const type = id.substr(0, 1);
  if (type !== '2' && type !== '1') {
    return -1;
  }
  let sum = 0;
  for (let i = 0; i < 10; i++) {
    if (i % 2 === 0) {
      const ZFOdd = String('00' + String(Number(id.substr(i, 1)) * 2)).slice(-2);
      sum += Number(ZFOdd.substr(0, 1)) + Number(ZFOdd.substr(1, 1));
    } else {
      sum += Number(id.substr(i, 1));
    }

  }
  return (sum % 10 !== 0) ? -1 : type;

}