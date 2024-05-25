class Student{
  final int? id;
  final String name;
  final int age;

  Student({this.id,required this.name,required this.age});


  Map<String,dynamic> tomap(){
    return {
      'id':id,
      'name':name,
      'age':age
    };
  }

  @override
   String toString() {
    return 'Student{id: $id, name: $name, age: $age}';
  }
}