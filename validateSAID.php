<?php
class ValidateSAID {

   function check($id_number){
    $id = trim($id_number);
    if(!is_numeric($id)) return -1;
    if(strlen($id) !== 10) return -1;
    $type = substr ( $id, 0, 1 );
    if($type != 2 && $type != 1 ) return -1;
    $sum = 0;
    for( $i = 0 ; $i<10 ; $i++ ) {
      if ( $i % 2 == 0){
        $ZFOdd = str_pad ( ( substr($id, $i, 1) * 2 ), 2, "0", STR_PAD_LEFT );
        $sum += substr ( $ZFOdd, 0, 1 ) + substr ( $ZFOdd, 1, 1 );
      }else{
        $sum += substr ( $id, $i, 1 );
      }
    }
    return $sum%10 ? -1 : $type;
  }
}
?>