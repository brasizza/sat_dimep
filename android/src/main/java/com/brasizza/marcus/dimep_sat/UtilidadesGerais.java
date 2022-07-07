package com.brasizza.marcus.dimep_sat;

import android.util.Base64;
import android.util.Log;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import java.io.File;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.Random;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;


public class UtilidadesGerais {


    public static int gerarNumeroSessao() {

        Random random = new Random();
        int numeroSessao = random.nextInt(999999);

        return numeroSessao;
    }

    public static String trataRetornoSAT(String retorno) {

        String[] retornoSplit = retorno.split("|");
        String codRetornoSAT = retornoSplit[1];
        String retornoSAT = retornoSplit[2];
        char chars[] = Charset.forName("UTF-8").encode(retornoSAT).asCharBuffer().array();
        retornoSAT = new String(chars);

        return "Retorno SAT: " + codRetornoSAT + " - " + retornoSAT;
    }

    public static String trataAlerta(String retorno) {

        String[] retornoSplit = retorno.split("|");
        String codRetornoSAT = retornoSplit[1];
        String retornoSAT = retornoSplit[3];
        char chars[] = Charset.forName("UTF-8").encode(retornoSAT).asCharBuffer().array();
        retornoSAT = new String(chars);

        String codAlerta = retornoSplit[2];
        String codMsgSefaz = retornoSplit[4];
        String msgSefaz = retornoSplit[5];
        char chars2[] = Charset.forName("UTF-8").encode(msgSefaz).asCharBuffer().array();
        msgSefaz = new String(chars2);

        return "Retorno SAT: " + codRetornoSAT + " - " + retornoSAT + " \nAlerta: {2} \nRetorno Sefaz: " + codAlerta + " - " + codMsgSefaz + " - " + msgSefaz;
    }

    public static String trataMsgSefaz(String retorno) {

        String[] retornoSplit = retorno.split("|");
        String codMsgSefaz = retornoSplit[3];
        String msgSefaz = retornoSplit[4];
        char chars[] = Charset.forName("UTF-8").encode(msgSefaz).asCharBuffer().array();
        msgSefaz = new String(chars);

        return "Retorno Sefaz: " + codMsgSefaz + " - " + msgSefaz;
    }

    private static String getValue(String tag, Element element) {

        NodeList nodeList = element.getElementsByTagName(tag).item(0).getChildNodes();
        Node node = nodeList.item(0);

        return node.getNodeValue();
    }

    

    public static String converter(String mensagem) {

        byte[] valueDecoded = Base64.decode(mensagem.getBytes(), Base64.DEFAULT);

        return new String(valueDecoded);
    }
}
