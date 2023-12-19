abstract class IHash{
  String? hash(String? plainText);
  String? hashWithKey({String plainText, String shaKey});
}