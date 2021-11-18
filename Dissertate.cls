
% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "Dissertate.cls",
%     version         = "2.0",
%     date            = "17 May 2021,
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, Dissertate",
%     supported       = "Send email to stefanciprian.voinea@studenti.unipd.it",
%     docstring       = "Class for a dissertation."
% --------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Dissertate}[2014/03/25 v2.0 Dissertate Class]
\LoadClass[12pt, twoside, openright, a4paper]{book}

\usepackage[nokeyprefix]{refstyle}

\usepackage{lipsum} 
\usepackage{tabularx}
\usepackage[bottom]{footmisc}
\usepackage{enumitem} 

\setlist{topsep=.3em, itemsep=0em}

\newcommand{\Quote}[3]{
	\begin{center}
		\begin{minipage}[H]{0.9\columnwidth}
			\begin{center}
				``\textit{#1}''~#2
			\end{center}
			\begin{flushright}
				\textit{ - #3}
			\end{flushright}
		\end{minipage}
	\end{center}
}

\RequirePackage{etoolbox}

\usepackage{amsmath,amssymb,amsthm}
\usepackage{graphicx}

\usepackage[automake, indexonlyfirst, numberline]{glossaries}

\renewcommand{\glsnamefont}[1]{\uppercase{\bfseries #1}}
\renewcommand{\gls}[1]{\textsc{#1}\textsubscript{G}\glsadd{#1}}

% Package used to highlight

\usepackage{soul}

\DeclareRobustCommand{\hlcyan}[1]{{\sethlcolor{cyan}\hl{#1}}}

% Line spacing: dsingle/ddouble
% Whether to use single- or doublespacing.
\newtoggle{DissertateSingleSpace}
\toggletrue{DissertateSingleSpace}
\DeclareOption{dsingle}{
    \toggletrue{DissertateSingleSpace}
    \ClassWarning{Dissertate}{Single-spaced mode on.}
}
\DeclareOption{ddouble}{\togglefalse{DissertateSingleSpace}}

\ProcessOptions\relax

% Line Spacing
% Define two line spacings: one for the body, and one that is more compressed.
\iftoggle{DissertateSingleSpace}{
    \newcommand{\dnormalspacing}{1.2}
    \newcommand{\dcompressedspacing}{1.0}
}{
    \newcommand{\dnormalspacing}{2.0}
    \newcommand{\dcompressedspacing}{1.2}
}

% Block quote with compressed spacing
\let\oldquote\quote
\let\endoldquote\endquote
\renewenvironment{quote}
    {\begin{spacing}{\dcompressedspacing}\oldquote}
    {\endoldquote\end{spacing}}

% Itemize with compressed spacing
\let\olditemize\itemize
\let\endolditemize\enditemize
\renewenvironment{itemize}
    {\begin{spacing}{\dcompressedspacing}\olditemize}
    {\endolditemize\end{spacing}}

% Enumerate with compressed spacing
\let\oldenumerate\enumerate
\let\endoldenumerate\endenumerate
\renewenvironment{enumerate}
    {\begin{spacing}{\dcompressedspacing}\oldenumerate}
    {\endoldenumerate\end{spacing}}

% Text layout.
% \RequirePackage[outer=1in, inner=1.55in, twoside, a4paper, showframe]{geometry}
%\RequirePackage[outer=1in, inner=1.55in, twoside, a4paper]{geometry} %PRINT VERSION
 \RequirePackage[outer=1.275in, inner=1.275in, twoside, a4paper]{geometry} % DIGITAL VERSION
\usepackage{ragged2e}
%\RaggedRight
\RequirePackage{graphicx}
%\usepackage{fixltx2e}
\parindent 12pt
\RequirePackage{lettrine}
\RequirePackage{setspace}
\RequirePackage{verbatim}

\newcolumntype{Y}{>{\centering\arraybackslash}X}

% Fonts.
\RequirePackage{color}
\RequirePackage{xcolor}
\usepackage{hyperref}
\RequirePackage{url}
\RequirePackage{amssymb}
\RequirePackage{mathspec}
\usepackage{ebgaramond}
%\setmathsfont(Digits,Latin,Greek)[Numbers={Proportional}]{EB Garamond}
%\setmathrm{EB Garamond}
\AtBeginEnvironment{tabular}{\addfontfeature{RawFeature=+tnum}}
\widowpenalty=300
\clubpenalty=300
%\setromanfont[Numbers=OldStyle, Ligatures={Common, TeX}, Scale=1.0]{EB Garamond}
%\newfontfamily{\smallcaps}[RawFeature={+c2sc,+scmp}]{EB Garamond}
\setsansfont[Scale=MatchLowercase, BoldFont={Lato Bold}]{Lato Regular}
\setmonofont[Scale=MatchLowercase]{Source Code Pro}
\RequirePackage[labelfont={bf,sf,footnotesize,singlespacing},
                textfont={sf,footnotesize,singlespacing},
                justification={justified,RaggedRight},
                singlelinecheck=false,
                margin=0pt,
                figurewithin=chapter,
                tablewithin=chapter]{caption}
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\RequirePackage{microtype}
\renewcommand{\thefootnote}{\arabic{footnote}}
\let\oldfootnote\footnote
\renewcommand{\footnote}[1]{\oldfootnote{~\fontspec{EB Garamond}#1}}

% Tikz
\usepackage{tikz}
\usetikzlibrary{arrows,automata,positioning}
\usepackage{pgfplots}
\pgfplotsset{compat=newest} 
\pgfplotsset{plot coordinates/math parser=false} 
\newlength\fheight
\newlength\fwidth
\usepackage{booktabs}
\usepackage{multirow}
%\usepackage{multicolumn}
\usepackage{subcaption}
\usetikzlibrary{shapes,arrows}
\usetikzlibrary{patterns,decorations.pathreplacing,backgrounds,calc}
\usepackage{afterpage}
\usepackage{tabulary}
\newcommand{\ra}[1]{\renewcommand{\arraystretch}{#1}}
\usepackage{pdfpages}

% Pseudocode
\usepackage{algorithm}
\usepackage[noend]{algpseudocode}
\renewcommand\algorithmicthen{}
\renewcommand\algorithmicdo{}
\@addtoreset{algorithm}{chapter}% algorithm counter resets every chapter
\usepackage{lscape}
\renewcommand{\thealgorithm}{\thechapter.\arabic{algorithm}}% Algorithm # is <chapter>.<algorithm>

\captionsetup{justification=centering}

% Abbreviations
\newcommand{\abbrlabel}[1]{\makebox[3cm][l]{\textbf{#1}\ \dotfill}}
\newenvironment{abbreviations}{\begin{list}{}{\renewcommand{\makelabel}{\abbrlabel}}}{\end{list}}


% Headings and headers.
\RequirePackage{fancyhdr}
\RequirePackage[tiny, md, sc]{titlesec}
\setlength{\headheight}{15pt}
\pagestyle{plain}
\RequirePackage{titling}

% Front matter.
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}
\usepackage[titles]{tocloft}
\usepackage[titletoc]{appendix}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\normalsize \scshape}
\renewcommand\listfigurename{Listing of figures}
\renewcommand\listtablename{Listing of tables}

% Endmatter
\renewcommand{\setthesection}{\arabic{chapter}.A\arabic{section}}

% References.

\renewcommand\bibname{References}
%\RequirePackage[super,comma,numbers]{natbib}
\RequirePackage[comma,numbers]{natbib}
\renewcommand{\bibnumfmt}[1]{[#1]}
\RequirePackage[palatino]{quotchap}
\renewcommand*{\chapterheadstartvskip}{\vspace*{-0.5\baselineskip}}
\renewcommand*{\chapterheadendvskip}{\vspace{1.3\baselineskip}}

\bibliographystyle{IEEEtran}
% In case of errors https://tex.stackexchange.com/questions/267277/latex-error-file-ieeetran-cls-not-found

\usepackage{url}
\def\UrlBreaks{\do\/\do-}

% An environment for paragraph-style section.
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}%
}

% Align reference numbers so that they do not cause an indent.
\newlength\mybibindent
\setlength\mybibindent{0pt}
\renewenvironment{thebibliography}[1]
    {\chapter*{\bibname}%
     \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
     \list{\@biblabel{\@arabic\c@enumiv}}
          {\settowidth\labelwidth{\@biblabel{999}}
           \leftmargin\labelwidth
            \advance\leftmargin\dimexpr\labelsep+\mybibindent\relax\itemindent-\mybibindent
           \@openbib@code
           \usecounter{enumiv}
           \let\p@enumiv\@empty
           \renewcommand\theenumiv{\@arabic\c@enumiv}}
     \sloppy
     \clubpenalty4000
     \@clubpenalty \clubpenalty
     \widowpenalty4000%
     \sfcode`\.\@m}
    {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}
     \endlist}

% Some definitions.
\def\advisor#1{\gdef\@advisor{#1}}
\def\mastername#1{\gdef\@mastername{#1}}
\def\coadvisorOne#1{\gdef\@coadvisorOne{#1}}
\def\coadvisorOneUniversity#1{\gdef\@coadvisorOneUniversity{#1}}
\def\coadvisorTwo#1{\gdef\@coadvisorTwo{#1}}
\def\committeeInternal#1{\gdef\@committeeInternal{#1}}
\def\committeeInternalOne#1{\gdef\@committeeInternalOne{#1}}
\def\committeeInternalTwo#1{\gdef\@committeeInternalTwo{#1}}
\def\committeeExternal#1{\gdef\@committeeExternal{#1}}
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degreeterm#1{\gdef\@degreeterm{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\department#1{\gdef\@department{#1}}
\def\field#1{\gdef\@field{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitystate#1{\gdef\@universitystate{#1}}
\def\programname#1{\gdef\@programname{#1}}
\def\pdOneName#1{\gdef\@pdOneName{#1}}
\def\pdOneSchool#1{\gdef\@pdOneSchool{#1}}
\def\pdOneYear#1{\gdef\@pdOneYear{#1}}
\def\pdTwoName#1{\gdef\@pdTwoName{#1}}
\def\pdTwoSchool#1{\gdef\@pdTwoSchool{#1}}
\def\pdTwoYear#1{\gdef\@pdTwoYear{#1}}

\hypersetup{
    colorlinks,
    citecolor=SchoolColor, 
    filecolor=black,
    linkcolor=black,
    urlcolor=SchoolColor,
}

\usepackage{tocloft}
\setlength{\cftsubsecnumwidth}{3.2em}

%% FRONT MATTER %%

\renewcommand{\frontmatter}{	
	
	\pagenumbering{roman}

	\input{frontmatter/personalize}
	
	\thispagestyle{empty}
	
	\setcounter{page}{1}

	\begin{center}
		
		% Big university logo
		% https://tex.stackexchange.com/questions/167719/how-to-use-background-image-in-latex
		\tikz[remember picture,overlay]
		\node[opacity=0.3,inner sep=0pt] at (current page.west){
			\includegraphics[height=1.04\paperheight]{resources/img/unipd/unipd-bn-light}
		};
		
		\vspace*{\fill}
		
		% University logo on top of the page
		\begin{figure}
			\centering
			\includegraphics[height=2.5cm]{resources/img/unipd/unipd-bn}
		\end{figure}
		
		\setstretch{1.5}
		
		\scshape{\Large{\bfseries{Università degli Studi di Padova}}} \\
		\line(1, 0){400} \\
		\scshape{\large{Department of Mathematics ``Tullio Levi Civita''}} \\
		
		\vspace{5pt}
		% \small{\textit{Bachelor Thesis in }}
		\small{\textit{Master Thesis in }}
		\@mastername
		
		\setstretch{2.5}
		
		\vspace{.7cm}
		
		\vspace{30pt}
		\scshape{\Huge{\bfseries{\textcolor{SchoolColor}{\thetitle}}}} \normalsize
		\vspace{25pt}
		\vspace{15pt}
		
		\setstretch{1.2}
		
		\vspace{1.5cm}
		
		\vfill
		\begin{normalsize}
			\begin{flushleft}
				\textit{Supervisor} \hfill \textit{Candidate}\\
				\vspace{1pt}
				\textbf{\@advisor} \hfill \textbf{\@author}\\
				\vspace{1pt}
				\textit{} \hfill \textit{Student ID}\\
				\vspace{.5pt}
				\textbf{} \hfill \textbf{1237294}\\
				%	  Università di Padova \\
				%	  \vspace{6pt}
				%	  \textit{Co-supervisor} \\
				%	  \@coadvisorOne \\
				%	  \@coadvisorOneUniversity
				\vspace{.1cm}
			\end{flushleft}
			\textbf{Accademic Year 2020 - 2021}
		\end{normalsize}
		
		
	\end{center}
	
	\vspace*{\fill}
	\singlespacing
	\cleardoublepage

	\copyrightpage
	
	\dedicationpage
	
	\setcounter{page}{5}
	
	\abstractpage
	\sommario
	
	\preface
	
	\tableofcontents
	
	\phantomsection
	\clearpage

	\addcontentsline{toc}{chapter}{List of figures}
	\renewcommand*\listfigurename{List of figures}
	\listoffigures

	\cleardoublepage
	
	\addcontentsline{toc}{chapter}{List of tables}
	\renewcommand*\listtablename{List of tables}
	\listoftables
	
	\phantomsection
	\cleardoublepage

	\cleardoublepage
	\setcounter{page}{1}
	\pagenumbering{arabic}
	
}

\newcommand{\copyrightpage}{	
%	\vspace*{18cm}
%	\begin{center}
%	\scshape \noindent \small \copyright \  \small  \theauthor \\
%	all rights reserved, % \@degreeyear
%	\end{center}
%	\cleardoublepage
%	\rm

	\noindent
	
	\begin{center}
		
		\begin{tabularx}{0.9\textwidth}{Xl}
			Open LoRa mesh network for IoT-based air quality sensing &  \\
			Master Thesis, Università degli Studi di Padova, December 2021
		\end{tabularx}
			
	\end{center}

	\vfill
	
	\begin{center}
		
		\begin{tabularx}{0.9\textwidth}{Xl}
			\textbf{Author} &  \\
			&  \\
			Voinea Stefan Ciprian & Università degli Studi di Padova\\
			Study programme: & Master's Degree in Computer Science \\
			E-mail: & \href{mailto://stefanciprian.voinea@studenti.unipd.it}{stefanciprian.voinea@studenti.unipd.it}\\
			E-mail: & \href{mailto://ciprian.voinea@outlook.com}{ciprian.voinea@outlook.com} \\
			&  \\
			&  \\
			\textbf{Supervising professors} &  \\
			&  \\
			Claudio Enrico Palazzi & Università degli Studi di Padova \\
			Study programme: & Assoc. Prof. in Computer Science \\
			E-mail: & \href{mailto://cpalazzi@math.unipd.it}{cpalazzi@math.unipd.it}\\
			Personal webpage & \href{https://www.math.unipd.it/~cpalazzi/}{https://www.math.unipd.it/\textasciitilde cpalazzi/}\\
			&  \\
			Pietro Manzoni &  Universitat Politècnica de València \\
			Study programme: & Prof. of Computer Engineering \\
			E-mail: & \href{mailto://pmanzoni@disca.upv.es}{pmanzoni@disca.upv.es}\\
			Personal webpage & \href{https://pmanzoni.github.io/}{https://pmanzoni.github.io/}
		\end{tabularx}
	
	\end{center}

	\cleardoublepage
	\rm

}

\newcommand{\dedicationpage}{
	\phantomsection
	\setcounter{page}{3}
	\vspace*{\fill}
	\scshape \noindent \input{frontmatter/dedication}
	\vspace*{\fill}
	\cleardoublepage
	\rm
}

\newcommand{\acknowledgments}{
	\phantomsection
	\chapter*{Acknowledgments}
	\noindent
	\input{acknowledgements}
	\vspace*{\fill} \newpage
	\cleardoublepage
	\rm
}

\newcommand{\abstractpage}{
	\phantomsection
	\addcontentsline{toc}{chapter}{Abstract}
	\chapter*{Abstract}
	\input{frontmatter/abstract}
	\cleardoublepage
}

\newcommand{\sommario}{
	\phantomsection
	\chapter*{Sommario}
	\addcontentsline{toc}{chapter}{Sommario}
	\input{frontmatter/sommario}
	\cleardoublepage
}

\newcommand{\preface}{
	\phantomsection
	\addcontentsline{toc}{chapter}{Preface}
	\chapter*{Preface}
	\input{frontmatter/preface}
	\cleardoublepage
}

\newcommand{\acronyms}{
	\phantomsection
	\addcontentsline{toc}{chapter}{Listing of acronyms}
	\chapter*{Listing of acronyms}
	\input{frontmatter/abbr.tex}
}

\renewcommand{\backmatter}{
    \input{endmatter/personalize}
    \clearpage
    \bibliographystyle{apalike2}
    \include{endmatter/colophon}
}