/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Aplicacion;

import Analizadores.IdLexer;
import Analizadores.Parser;
import java.io.StringReader;
import java_cup.runtime.Scanner;

/**
 *
 * @author Eryyc
 */
public class App {

    public static void main(String[] args) throws Exception{
        
        String expresion = "25+3*4+2*8";
        IdLexer lexer = new IdLexer(new StringReader(expresion));
        Parser p = new Parser(lexer);
        Integer resultado = (Integer) p.parse().value;
        System.out.println(resultado);

    }
    
  

}
