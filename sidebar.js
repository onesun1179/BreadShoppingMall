function check_type(num) {
    switch(num) {
        case '1' : document.getElementById('hidden_1').submit(); break;
        case '2' : document.getElementById('hidden_2').submit(); break;
        case '3' : document.getElementById('hidden_3').submit(); break;
    }

}
function output_bread(num, name, imgType, type, price){

    var div = document.createElement("div");
    div.id = "bread" + num;
    div.innerHTML = "<img src='images/"+type+"/"+num+"."+imgType+"' style='height:200px; width:200px' /><span>빵 이름 : "+name+"</span>"+
        "<span>빵 종류 : "+type+"</span><span>빵 가격 : "+ price+"</span>";

    document.getElementById('bread_list').appendChild(div);
}

function dddd(num) {
  document.getElementById("dddd").innerHTML = num.toString();
}
