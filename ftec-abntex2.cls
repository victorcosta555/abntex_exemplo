%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Customizações do abnTeX2 para a FTEC Porto Alegre                                %
%% This work may be distributed and/or modified under the                           %
%% conditions of the LaTeX Project Public License, either version 1.3               %
%% of this license or (at your option) any later version.                           %
%% The latest version of this license is in                                         %
%%   http://www.latex-project.org/lppl.txt                                          %
%% and version 1.3 or later is part of all distributions of LaTeX                   %
%% version 2005/12/01 or later.                                                     %
%% This work has the LPPL maintenance status `maintained'.                          %
%%                                                                                  %  
%%                                                                                  %
%% Maiores informações sobre o abntex está disponível em http://www.abntex.net.br/  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ftec-abntex2}[11/08/2021 v1.0 Modelo FTEC POA baseado no projeto abnTeX2]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PARÂMETROS INICIAIS ABNTEX2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Trabalhos de Graduação
\DeclareOption{bsc}{%
  \let\@degreetype=0}

%% Trabalhos de Especialização
\DeclareOption{spe}{%
  \let\@degreetype=1}


% Repassa todos os parametros a classe abntex2
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{abntex2}
}


\ProcessOptions\relax
\LoadClass[sumario = tradicional, 12pt, openright, oneside, a4paper]{abntex2}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PACOTES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{cmap}                 % Mapear caracteres especiais no PDF
\usepackage[utf8]{inputenc}       % Codificacao do documento
\usepackage{lastpage}             % Para total de páginas

\usepackage{newtxtext, newtxmath} % Usa a fonte Times New Roman
\renewcommand{\ABNTEXchapterfont}{\rmfamily\bfseries}

\usepackage[T1]{fontenc}		  % Selecao de codigos de fonte
\usepackage{lastpage}			  % Usado pela Ficha catalográfica
\usepackage{indentfirst}		  % Indenta o primeiro parágrafo de cada seção
\usepackage{color}			      % Controle das cores
\usepackage{graphicx}			  % Inclusão de gráficos
\usepackage{microtype} 			  % para melhorias de justificação

\usepackage[brazilian,hyperpageref]{backref}
\usepackage[alf]{abntex2cite}	  
% Citações padrão ABNT
% \usepackage[alf,abnt-etal-cite=0,abnt-etal-list=0]{abntex2cite}

\usepackage{parskip}			  % espaçamento entre os parágrafos
\usepackage{xcolor}
\usepackage{url}                  % deve ser carregado para tratar url de forma correta e usado pelo abntex2cite
\usepackage{listings, lstautogobble}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PACOTES POR TIPO DE DOCUMENTO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\if \@degreetype0
   \usepackage{Graduacao}
   \else \if \@degreetype1
       \usepackage{Especializacao}
   \fi
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CONFIGURAÇÕES DO PACOTE BACKREF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Usado sem a opção hyperpageref de backref
\renewcommand{\backrefpagesname}{Citado na(s) página(s):~}
% Texto padrão antes do número das páginas
\renewcommand{\backref}{}
% Define os textos da citação
\renewcommand*{\backrefalt}[4]{
	\ifcase #1 %
		Nenhuma citação no texto.%
	\or
		Citado na página #2.%
	\else
		Citado #1 vezes nas páginas #2.%
	\fi}%
% ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CAPA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Comandos de dados - Curso
\providecommand{\imprimircurso}{}
\newcommand{\curso}[1]{\renewcommand{\imprimircurso}{#1}}

\local{Goiânia}
\data{\the\year}

\renewcommand{\imprimircapa}{%
  \begin{capa}%
  
		\centering \includegraphics[scale=1]{Imagens/faculdade-engenharia.png}
		
		\imprimirinstituicao
	    \vspace*{\fill}
    
	    \centering
    	\vspace*{\fill}
	    \vspace*{3.0cm}
    	
	    {\ABNTEXchapterfont\Large\imprimirtitulo}
    	\vspace*{1.0cm}
    	
	    \imprimirtipotrabalho
    	\vspace*{\fill}

	    {\Large\imprimirautor}
    	\vspace*{2.0cm}
	    \vspace*{\fill}
    
    	\imprimirlogo
    
    	{\imprimirlocal}
	    \par
    	{\imprimirdata}

	    \vspace*{1cm}
  \end{capa}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FOLHA DE ROSTO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\makeatletter
\renewcommand{\folhaderostocontent}{
	\begin{center}
		\imprimirinstituicao
		\par
		\vspace*{\fill}

		{\Large\imprimirautor}

		\vspace*{3.5cm}
		{\ABNTEXchapterfont\Large\imprimirtitulo}
		
		\vspace*{\fill}

		\abntex@ifnotempty{\imprimirpreambulo}{%
			 \hspace{.40\textwidth}
			  \begin{minipage}{9cm}
				  \SingleSpacing
				  \imprimirpreambulo
			  \end{minipage}%
		}%
		
		\vspace*{1.0cm}
		\abntex@ifnotempty{\imprimirorientador}{%
			\hspace{.40\textwidth}
  				\begin{minipage}{9cm}
					\SingleSpacing
					Orientador(a):
					\imprimirorientador
					\vfill
					\ifthenelse{\equal{\imprimircoorientador}{}}
						{
							%Não escrever nada se não tiver coorientador
						}
						{
							Coorientador(a): \imprimircoorientador
							\vfill
						}
						
				\end{minipage}%
			\vspace*{\fill}
		}%

\vspace*{\fill}
{\imprimirlocal\par}
{\imprimirdata\vspace*{1cm}}
\end{center}
}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CONFIGURAÇÃO DE APARÊNCIA DO PDF FINAL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% alterando o aspecto da cor azul
	\definecolor{blue}{RGB}{41,5,195}
	
% informações do PDF
\makeatletter

\hypersetup{
	unicode=true, 
	colorlinks=true,       		% false: boxed links; true: colored links
	linkcolor=blue,          	% color of internal links
	citecolor=blue,        		% color of links to bibliography
	filecolor=magenta,      	% color of file links
	urlcolor=blue,
	bookmarksdepth=4,
	breaklinks=true             % define a quebra de links
}

\makeatother 


\newcommand{\inserirInformacoesPDF}{
	\makeatletter

	\hypersetup{
		pdftitle={\imprimirtitulo}, 
		pdfauthor={\imprimirautor},
		pdfsubject={\imprimircurso},
		pdfcreator={\imprimirorientador},
		pdfkeywords={abnTeX2, FTEC},
	}
	
	\makeatother 

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ESPAÇAMENTO ENTRE LINHAS E PARÁGRAFOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% O tamanho do parágrafo é dado por:
\setlength{\parindent}{1.3cm}

% Controle do espaçamento entre um parágrafo e outro:
\setlength{\parskip}{0.2cm}  % tente também \onelineskip

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FICHA CATALOGRÁFICA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Apenas em Mestrado.sty


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FOLHA DE APROVAÇÃO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nos arquivos .sty


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SUMARIO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Uso do sumário tradicional, com espaçamento entre os capítulos
\setlength{\cftbeforechapterskip}{1em}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LISTA DE CÓDIGOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\codigoname}{Código}
\newcommand{\listofcodigosname}{Lista de códigos}

\newfloat[chapter]{codigo}{loc}{\codigoname}
\newlistof{listofcodigos}{loc}{\listofcodigosname}
\newlistentry{codigo}{loc}{0}

% configurações para atender às regras da ABNT
\setfloatadjustment{codigo}{\centering}
\counterwithout{codigo}{chapter}
\renewcommand{\cftcodigoname}{\codigoname\space} 
\renewcommand*{\cftcodigoaftersnum}{\hfill--\hfill}

\setfloatlocations{codigo}{hbtp}

\definecolor{mygreen}{rgb}{0,0.6,0}
\definecolor{mygray}{rgb}{0.5,0.5,0.5}
\definecolor{mymauve}{rgb}{0.58,0,0.82}

\lstset{
    basicstyle=\ttfamily\small,
    numberstyle=\footnotesize,
    numbers=left,
    backgroundcolor=\color{gray!10},
    frame=single,
    tabsize=2,
    rulecolor=\color{black!30},
    %title=\lstname,
    breaklines=true,
    breakatwhitespace=true,
    commentstyle=\color{mygreen},    % comment style
    escapeinside={\%*}{*)},          % if you want to add LaTeX within your code
    keywordstyle=\color{blue},       % keyword style
    stringstyle=\color{mymauve},     % string literal style
    autogobble=true,
    showstringspaces=false
}
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LISTA DE QUADROS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\quadroname}{Quadro}
\newcommand{\listofquadrosname}{Lista de quadros}

\newfloat[chapter]{quadro}{loq}{\quadroname}
\newlistof{listofquadros}{loq}{\listofquadrosname}
\newlistentry{quadro}{loq}{0}

% configurações para atender às regras da ABNT
\setfloatadjustment{quadro}{\centering}
\counterwithout{quadro}{chapter}
\renewcommand{\cftquadroname}{\quadroname\space} 
\renewcommand*{\cftquadroaftersnum}{\hfill--\hfill}

% Ver https://github.com/abntex/abntex2/issues/176
\setfloatlocations{quadro}{hbtp} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LISTA DE ALGORITMOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\algoritmoname}{Algoritmo}
\newcommand{\listofalgoritmosname}{Lista de algoritmos}

\newfloat[chapter]{algoritmo}{loa}{\algoritmoname}
\newlistof{listofalgoritmos}{loa}{\listofalgoritmosname}
\newlistentry{algoritmo}{loa}{0}

% configurações para atender às regras da ABNT
\setfloatadjustment{algoritmo}{\centering}
\counterwithout{algoritmo}{chapter}
\renewcommand{\cftalgoritmoname}{\algoritmoname\space} 
\renewcommand*{\cftalgoritmoaftersnum}{\hfill--\hfill}

\setfloatlocations{algoritmo}{hbtp}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FORMATO DOS CAPÍTULOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\chapnumfont}{%
    \vspace*{1cm}    
    \usefont{T1}{pnc}{b}{n}%      % choose New Chancery, bold, normal shape
    \fontsize{100}{100}%          % font size 100pt, baselineskip 100pt
    \color{gray!75}%                 
    \selectfont%                  % activate font
}

\renewcommand{\chaptitlefont}{\ABNTEXchapterfont\ABNTEXchapterfontsize\color{black}}

\renewcommand\printchaptertitle[1]{%
    \chaptitlefont%
    \ifthenelse{\boolean{abntex@innonumchapter}}{%
    \centering\ABNTEXchapterupperifneeded{#1}}{%
    \ifthenelse{\boolean{abntex@apendiceousecao}}{%
        \centering%
        \settowidth{\chapternamenumlength}{\printchaptername\printchapternum\afterchapternum}%
        \ABNTEXchapterupperifneeded{#1}%
      }{%
        {\printchaptername\afterchapternum}%
        \parbox[t]{\columnwidth-\chapternamenumlength}{\ABNTEXchapterupperifneeded{#1}}}%
     }    
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% COMANDOS PARA MOSTRAR LISTAS E SUMARIO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\mostrarlistadeQUADROS}{
	\pdfbookmark[0]{\listofquadrosname}{loq}
	\listofquadros*
	\cleardoublepage
}

\newcommand{\mostrarlistadeCODIGOS}{
    \pdfbookmark[0]{\listofcodigosname}{loc}
    \listofcodigos*
    \cleardoublepage
}

\newcommand{\mostrarlistadeILUSTRACOES}{
	\pdfbookmark[0]{\listfigurename}{lof}
	\listoffigures*
	\cleardoublepage
}

\newcommand{\mostrarlistadeTABELAS}{
	\pdfbookmark[0]{\listtablename}{lot}
	\listoftables*
	\cleardoublepage
}

\newcommand{\mostrarlistadeALGORITMOS}{
	\pdfbookmark[0]{\listofalgoritmosname}{loa}
	\listofalgoritmos*
	\cleardoublepage
}

\newcommand{\mostrarSUMARIO}{
	\pdfbookmark[0]{\contentsname}{toc}
	\tableofcontents*
	\cleardoublepage
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%