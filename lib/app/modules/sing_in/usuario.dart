
class Usuario{

  String _nome;
  
  String _cep;
  String _email;
  String _senha;

  Usuario(this._nome, this._cep, this._email, this._senha);

  Map<String, dynamic> toMap(){

    Map<String, dynamic> map = {
      "nome" : this.nome,
      
      "cep" : this.cep,
      "email" : this.email,
    };
    return map;
  }

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get cep => _cep;

  set cep(String value) {
    _cep = value;
  }


  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }
}