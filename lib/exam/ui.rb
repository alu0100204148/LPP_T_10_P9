# -*- coding: utf-8 -*-
require 'rubygems'
require 'bundler/setup'
require 'rspec'

module Exam
  class UI
    attr_reader :contenido, :aciertos, :nota
    
    
    def initialize (examen)
      @contenido = examen
      @aciertos = 0
      @nota = -1
      @numeroPreguntas = examen.lista_preguntas.count
    end
    
    
    def mostrarPregunta(numero)
      print "Pregunta"
      puts numero
      return @contenido.obtenerPregunta(numero)
    end
    
    
    def input(numeroPregunta, resp=0)
      puts ""
      print "Respuesta: "
      STDOUT.flush
      if resp == 0 then
        respuesta = gets.chomp
      else
        respuesta = resp
        puts respuesta
      end
      puts ""
      puts ""
      puts ""
      puts ""
      comparar(numeroPregunta, respuesta)
      return true
    end
    
    
    def comparar(numeroPregunta, respuesta)
      if respuesta == @contenido.lista_soluciones.obtenerValor(numeroPregunta) then
        @aciertos = @aciertos + 1
        return true
      end
    end


    def notaFinal
      print "Aciertos: "
      print @aciertos
      print " / "
      puts @numeroPreguntas
      print "Su nota ha sido: "
      @nota = ((@aciertos * 10) / @numeroPreguntas)
      print @nota
      return @nota
    end
    
  end
end