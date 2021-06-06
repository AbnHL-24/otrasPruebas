%lex

%%
\s+            {/*espacio en blanco*/}

//------------------------------------------------------Basicos rutas xpath------------------------------------------------------



"/" {
    console.log('Detecto diagonal'); 
     return 'diagonal'; 
}

"." {
    console.log('Detecto punto');
     return 'punto'; 
}


"@" {
    console.log('Detecto arroba');
     return 'arroba'; 
}

"node" {
    console.log('Detecto node');
     return 'node'; 
}

"text" {
    console.log('Detecto node');
     return 'node'; 
}

"last" {
    console.log('Detecto last');
     return 'last'; 
}

"position" {
    console.log('Detecto position');
     return 'position'; 
}



//------------------------------------------------------AXES------------------------------------------------------



"ancestor" {
    console.log('Detecto POSITION');
     return 'POSITION'; 
}

"ancestor-or-self" {
    console.log('Detecto ancestor-or-self');
     return 'ancestor-or-self'; 
}

"attribute" {
    console.log('Detecto attribute');
     return 'attribute'; 
}

"child" {
    console.log('Detecto child');
     return 'child'; 
}

"descendant" {
    console.log('Detecto descendant');
     return 'descendant'; 
}

"descendant-or-self" {
    console.log('Detecto descendant-or-self');
     return 'descendant-or-self'; 
}

"following" {
    console.log('Detecto following');
     return 'following'; 
}

"following-sibling" {
    console.log('Detecto following-sibling');
     return 'following-sibling'; 
}

"namespace" {
    console.log('Detecto namespace');
     return 'namespace'; 
}

"parent" {
    console.log('Detecto parent');
     return 'parent'; 
}

"preceding" {
    console.log('Detecto preceding');
     return 'preceding'; 
}

"preceding-sibling" {
    console.log('Detecto preceding-sibling');
     return 'preceding-sibling'; 
}

"self" {
    console.log('Detecto self');
     return 'self';
}



//------------------------------------------------------OPERADORES------------------------------------------------------




"|" {
    console.log('Detecto operador_o');
    return 'operador_o';
}

"+" {
    console.log('Detecto suma');
    return 'suma';
}

"-" {
    console.log('Detecto resta');
    return 'resta';
}

"*" {
    console.log('Detecto multiplicacion');
    return 'multiplicacion';
}

"div" {
    console.log('Detecto division');
    return 'division';
}

"=" {
    console.log('Detecto igual');
    return 'igual';
}

"!=" {
    console.log('Detecto diferente');
    return 'diferente';
}

"<" {
    console.log('Detecto menor');
    return 'menor';
}

"<=" {
    console.log('Detecto menor_igual');
    return 'menor_igual';
}

">" {
    console.log('Detecto mayor');
    return 'mayor';
}

">" {
    console.log('Detecto mayor_igual');
    return 'mayor_igual';
}

"or" {
    console.log('Detecto or');
    return 'or';
}

"and" {
    console.log('Detecto and');
    return 'and';
}

"mod" {
    // equivalente a %
    console.log('Detecto mod');
    return 'mod';
}


"(" { 
    console.log('Detecto PARENTESIS_ABIERTO'); 
     return 'PARENTESIS_ABIERTO'; 
    }

")" { 
    console.log('Detecto PARENTESIS_CERRADO'); 
     return 'PARENTESIS_CERRADO'; 
    }

":" { 
    console.log('Detecto DOS_PUNTOS'); 
     return 'DOS_PUNTOS'; 
    }



//------------------------------------------------------EXPRESIONES------------------------------------------------------


[1-9][0-9]*("."0*[1-9]*0*)?\b { 
    console.log('Detecto DIGITO'); 
     return 'DIGITO'; 
    }

\w+  { 
    console.log('Detecto identificador'); 
     return 'identificador'; 
    }

<<EOF>>   return 'EOF';

.					{     
    errores.push(['Lexico','dato: '+yytext,'Linea '+yylloc.first_line,'columna '+yylloc.first_column]);
    }
/lex
%{

%}

%start INIT

%%
INIT : OPCIONES_XPATH EOF {
    console.log('exito con analisis');
}
;

OPCIONES_XPATH : OPCION_XPATH OPCIONES_XPATH | OPCION_XPATH
;

OPCION_XPATH : diagonal identificador 
    | diagonal diagonal identificador;
