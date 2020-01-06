\def\update{2016/12/07 v1.01}

\newcommand{\theclass}{SIOpset.cls}
\newcommand{\theclassshort}{SIOpset}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{SIOpset}[\update\ \theclass]

\let\@instructor\relax
\def\instructor#1{\def\@instructor{#1}}
\let\@thisquarter\relax
\def\thisquarter#1{\def\@thisquarter{#1}}
\let\@coursenumber\relax
\def\coursenumber#1{\def\@coursenumber{#1}}
\let\@coursename\relax
\def\coursename#1{\def\@coursename{#1}}
\let\@abstracttitle\relax
\def\abstracttitle#1{\def\@abstracttitle{#1}}

\newif\if@timesfont
\DeclareOption{times}{%
\@timesfonttrue}

\newif\if@doublespace
\DeclareOption{doublespace}{%
\@doublespacetrue}

%Setup the trim and text areas
\newif\if@shortAfour
\DeclareOption{shortAfour}{%
\@shortAfourtrue}

\newif\if@Afour
\DeclareOption{Afour}{%
\@Afourtrue}

\newif\if@MCfour
\DeclareOption{MCfour}{%
\@MCfourtrue}

\newif\if@PCfour
\DeclareOption{PCfour}{%
\@PCfourtrue}

\newif\if@Royal
\DeclareOption{Royal}{%
\@Royaltrue}

\newif\if@Crown
\DeclareOption{Crown}{%
\@Crowntrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}

\if@timesfont
\RequirePackage{times}
\usepackage[scaled=.95]{helvet}
\fi
\if@doublespace
\RequirePackage[onehalfspacing]{setspace}
\fi

\RequirePackage{graphicx}
\RequirePackage{latexsym,ifthen,rotating,calc,textcase,booktabs,color,endnotes}
\RequirePackage{amsfonts,amssymb,amsbsy,amsmath,amsthm}
%\RequirePackage{bm}
\RequirePackage[errorshow]{tracefnt}

\@twosidetrue
\flushbottom
\frenchspacing

\let\mysf\sf
\if@PCfour
\let\mysf\rm
\fi

%papersize={width,height}
\if@shortAfour
\usepackage[text={170.5mm,226mm},%
papersize={210mm,280mm},%
columnsep=12pt,%
headsep=21pt,%
centering]{geometry}
\usepackage{ftnright}
\fi

%papersize={width,height}
\if@Afour
\usepackage[text={174mm,258mm},%
papersize={210mm,297mm},%
columnsep=12pt,%
headsep=21pt,%
centering]{geometry}
\usepackage{ftnright}
\fi

%papersize={width,height}
\if@MCfour
\usepackage[text={151.5mm,196mm},%
papersize={189mm,246mm},%
columnsep=12pt,%
headsep=21pt,%
centering]{geometry}
\usepackage{ftnright}
\fi

%papersize={width,height}
\if@PCfour
\usepackage[text={138mm,198mm},%
papersize={170mm,242mm},%
columnsep=12pt,%
headsep=21pt,%
centering]{geometry}
\usepackage{ftnright}
\fi

%papersize={width,height}%single column
\if@Royal
\usepackage[text={124mm,185mm},%
papersize={156mm,234mm},%
columnsep=12pt,%
headsep=21pt,%
centering]{geometry}
\fi

%papersize={width,height}%single column
\if@Crown
\usepackage[text={146.5mm,183mm},%
papersize={7.25in,9.5in},%
columnsep=12pt,%
headsep=21pt,%
centering]{geometry}
\fi

\parindent 1em

\hyphenpenalty=1000
\pretolerance=8000
\tolerance=9500
\hbadness=8000
\vbadness=9000
\displaywidowpenalty=0
\clubpenalty=10000
\widowpenalty=10000
\lefthyphenmin=3%
\righthyphenmin=3%
\brokenpenalty=10000%

\thinmuskip = 3mu
\medmuskip = 4mu
\thickmuskip = 5mu

\setcounter{topnumber}{10}
\def\topfraction{1}
\setcounter{bottomnumber}{10}
\def\bottomfraction{0.8}
\setcounter{totalnumber}{10}
\def\textfraction{0}
\renewcommand{\floatpagefraction}{0.95}
\setcounter{dbltopnumber}{10}
\renewcommand{\dblfloatpagefraction}{0.95}
\renewcommand{\dbltopfraction}{1}

\renewcommand\small{%
   \@setfontsize\small\@ixpt{10.5}%
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               %\parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand{\refsize}{\fontsize{9}{12pt}\selectfont}
\renewcommand{\footnotesize}{\fontsize{8}{10pt}\selectfont}
\renewcommand{\scriptsize}{\fontsize{7.0}{8.5pt}\selectfont}
\renewcommand{\large}{\fontsize{12}{14pt}\selectfont}
\newcommand{\titlesize}{\fontsize{18.0}{20pt}\selectfont}

\newbox\absbox
\def\abstract{\lrbox\absbox\minipage{\textwidth}%
  \mysf\normalsize%
  \section*{\normalsize \@abstracttitle}\vskip -1.5mm%
  }
\def\endabstract{\endminipage\endlrbox}

\def\keywords#1{%
  \gdef\@keywords{\begin{minipage}{\textwidth}{\normalsize\mysf \textbf{Keywords}}\\ \parbox[t]{\textwidth}{#1}\end{minipage}}}
\let\@keywords\@empty

\skip\footins 20pt plus  8pt
%\gdef\footnoterule{}
\def\footnoterule{\kern-3\p@
  \hrule \@width \columnwidth \kern 3mm}

\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\long\def\@makefntext#1{\parindent 1em%
\noindent{$\m@th^{\@thefnmark}$}#1}

\newcommand{\email}[1]{%
  \gdef\@email{%
\footnotetext[0]{\mysf Email: #1}}}
\let\@email\@empty

\def\corrauth#1{\gdef\@corrauth{%
\footnotetext[0]{\par\vskip-3pt\mysf\noindent\textbf{Contact:}\\ #1}}}
\let\@corrauth\@empty

\def\affiliation#1{%
  \gdef\@affiliation{%
    \footnotetext[0]{\mysf #1}}}
\let\@affiliation\@empty

\def\affilnum#1{${}^{\text{{#1}}}$}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% maketitle
%%%%%%%%

\renewcommand\maketitle{\par
  \begingroup
     \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
       \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{title}\label{FirstPage}\@affiliation\@corrauth\@email%
  \endgroup
  %\setcounter{footnote}{0}%
  \global\let\affiliation\relax
   \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\@affiliation\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
\if@Royal
\vspace*{-20pt}
\fi
\if@Crown
\vspace*{-20pt}
\fi
\vspace*{-34pt}%
\null%
\begin{center}
\if@PCfour
\begin{rm}
\else
\begin{sf}
\fi
\begin{minipage}[t]{\textwidth-57.625mm}
  \vskip 12.5pt%
    {\raggedright\titlesize\textbf{\@title \\ \medskip {\large \today}} \par}%
    \vskip 1.5em%
    \vskip 12.5mm%
    \end{minipage}\hspace{15mm}\begin{minipage}[t]{42.625mm}
\hbox{}\footnotesize\includegraphics[width=\textwidth]{SIOlogo.png}\\
\hbox{}\@thisquarter\\
\hbox{}\@coursenumber\\
\hbox{}\@coursename\\
\hbox{}\@instructor\\
\end{minipage}
{\par\large%
\if@Royal
      \vspace*{6mm}
      \fi
      \if@Crown
      \vspace*{6mm}
      \fi%
      \lineskip .5em%
      {\raggedright\textbf{\@author}
      \par}}
     \vskip 40pt%
    {\noindent\usebox\absbox\par}
    {\vspace{20pt}%
      %
       {\noindent\normalsize\@keywords}\par}
       \if@PCfour
       \end{rm}
       \else
       \end{sf}
       \fi
       \end{center}
       \if@Royal
       \vspace*{-4.5mm}
       \fi
       \if@Crown
       \vspace*{-4.5mm}
       \fi
       \vspace{2pt}
         \par%
  }
 
\def\startpage{\pageref{FirstPage}}
\def\endpage{\pageref{LastPage}}
\def\volumeyear{0000}
\def\volumenumber{XX}
\def\issuenumber{X}
\def\journalname{Journal Title}

\def\runninghead#1{\markboth{{#1}}{}}

\def\ps@title{%
\def\@oddhead{\parbox{\textwidth}{\mbox{}\\[-1pt]%
\noindent\rule{\textwidth}{0.5pt}%
}}%
\let\@evenhead\@oddhead
\def\@oddfoot{\parbox[t]{\textwidth}{%
}}
\let\@evenfoot\@oddfoot}

\def\ps@mypage{%
\let\@mkboth\@gobbletwo
\def\@evenhead{\parbox{\textwidth}{%
\normalsize\mysf\thepage\hfill\itshape\leftmark\\[-6pt]
\noindent\rule{\textwidth}{0.25pt}}}
\def\@oddhead{\parbox{\textwidth}{%
\normalsize\mysf{\itshape{\leftmark}}\hfill\thepage\\[-6pt]
\noindent\rule{\textwidth}{0.25pt}}}
\def\@evenfoot{\parbox[t]{\textwidth}{%
}}
\def\@oddfoot{\@evenfoot}
}

%\renewcommand{\@seccntformat}[1]{{\csname the#1\endcsname.}\hspace{0.5em}}
\setcounter{secnumdepth}{-2}

\newdimen\@bls                              
\@bls=\baselineskip

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {1.2\@bls  plus .3\@bls minus .1\@bls}%
                                   {5pt\@afterindentfalse}%
                                   {\mysf\large\bfseries\raggedright}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {0.9\@bls plus .3\@bls minus .1\@bls}%
                                     {4pt\@afterindentfalse}%
                                     {\mysf\large\itshape\raggedright}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {0.5\@bls plus .3\@bls minus .1\@bls}%
                                     {-0.5em\@afterindentfalse}%
                                     {\mysf\normalsize\itshape}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{1em}%
                                     {0.3\@bls plus .3\@bls minus .1\@bls}%
                                     {-0.5em\@afterindentfalse}%
                                     {\mysf\normalsize\itshape}}

\def\enumerate{\ifnum \@enumdepth >3 \@toodeep\else
      \advance\@enumdepth \@ne
      \edef\@enumctr{enum\romannumeral\the\@enumdepth}\list
      {\csname label\@enumctr\endcsname}{\usecounter
        {\@enumctr}\itemsep 0pt\parsep 0pt
         \def\makelabel##1{\hss\llap{##1}}}\fi}

\let\endenumerate =\endlist

\def\itemize{\ifnum \@itemdepth >3 \@toodeep\else \advance\@itemdepth \@ne
\edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
\list{\csname\@itemitem\endcsname}{\itemsep 0pt\parsep 0pt
\def\makelabel##1{\hss\llap{##1}}}\fi}

\let\enditemize =\endlist

\RequirePackage{caption}
\DeclareCaptionLabelSeparator{myperiod}{.\hspace*{1ex}}
\captionsetup[figure]{font=small,labelfont={sf,bf},textfont=sf,labelsep=myperiod,justification=raggedright,singlelinecheck=false}
\captionsetup[table]{position=top,labelsep=myperiod,font=small,labelfont={sf,bf},textfont=sf,justification=raggedright,skip=2pt,singlelinecheck=false}

\def\@begintheorem#1#2[#3]{%
  \deferred@thm@head{\the\thm@headfont \thm@indent
    \@ifempty{#1}{\let\thmname\@gobble}{\let\thmname\@iden}%
    \@ifempty{#2}{\let\thmnumber\@gobble}{\let\thmnumber\@iden}%
    \@ifempty{#3}{\let\thmnote\@gobble}{\let\thmnote\@iden}%
    \thm@swap\swappedhead\thmhead{#1}{#2\the\thm@headpunct}{#3}%
    %\the\thm@headpunct
    \thmheadnl % possibly a newline.
    \hskip\thm@headsep
  }%
  \ignorespaces}

\def\thmhead@plain#1#2#3{%
  \thmname{#1}\thmnumber{\@ifnotempty{#1}{ }{#2}}%
  \thmnote{ {\the\thm@notefont #3. }}}
  
\newenvironment{acks}[1]%
{\subsection*{\normalsize\mysf\bfseries Acknowledgements}\begin{refsize}\noindent #1}%
{\end{refsize}}

\newenvironment{funding}[1]%
{\subsection*{\normalsize\mysf\bfseries Funding}\begin{refsize}\noindent #1}%
{\end{refsize}}

\newenvironment{sm}[1]%
{\subsection*{\normalsize\mysf\bfseries Supplemental material}\begin{refsize}\noindent #1}%
{\end{refsize}}
 
\newenvironment{dci}[1]%
{\subsection*{\normalsize\mysf\bfseries Declaration of conflicting interests}\begin{refsize}\noindent #1}%
{\end{refsize}} 

\newenvironment{biog}[1]%
{\subsection*{\normalsize\mysf\bfseries Author biography}\begin{refsize}\noindent #1}%
{\end{refsize}}

\newenvironment{biogs}[1]%
{\subsection*{\normalsize\mysf\bfseries Author Biographies}\begin{refsize}\noindent #1}%
{\end{refsize}}
  
%Endnotes
\def\enotesize{\refsize}

\def\enoteheading{\subsection*{\normalsize\mysf\bfseries\notesname}%
  \mbox{}\par\vskip-\baselineskip}

\renewcommand{\enoteformat}{%
   \rightskip\z@ \leftskip15pt \parindent=0pt
   \leavevmode{\makebox[0cm][r]{%
   \hbox to15pt{\@theenmark.\hfill}}}}
 
\newtheoremstyle{my}
{6pt plus 2pt minus 2pt}% space above
{6pt plus 2pt minus 2pt}% space below
{\it}% Body font
{}% Indent amount
{\bfseries}% Theorem head font
{.}% Punctuation after theorem head
{0.75em}% Space after theorem head
{}% Theorem head spec

\theoremstyle{my}

\renewenvironment{proof}[1][\proofname]{\par
  %AS\pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \bfseries
    #1\@addpunct{.}]\ignorespaces
}{%
  %AS\popQED
  \endtrivlist\@endpefalse
}

\AtEndDocument{%
\label{LastPage}}

\pagestyle{mypage}

\if@shortAfour
\twocolumn
\fi

\if@Afour
\twocolumn
\fi

\if@MCfour
\twocolumn
\fi

\if@PCfour
\twocolumn
\fi

\normalsize
\sloppy

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Settings For Code Listings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{listings}

\DeclareFixedFont{\ttb}{T1}{txtt}{bx}{n}{8} % for bold
\DeclareFixedFont{\ttm}{T1}{txtt}{m}{n}{8}  % for normal
\definecolor{deepblue}{rgb}{0,0,0.5}
\definecolor{deepred}{rgb}{0.6,0,0}
\definecolor{deepgreen}{rgb}{0,0.5,0}
\definecolor{lightgray}{rgb}{0.65, 0.65, 0.65}
\definecolor{background}{rgb}{0.95, 0.95, 0.95}
\definecolor{orange}{rgb}{1,0.5,0}

% Generic code style for highlighting
\newcommand\codestyle{\lstset{
language=Mathematica,
basicstyle=\scriptsize\ttfamily,
commentstyle=\color{black},
%otherkeywords={whichever},
keywordstyle=\color{black},
stringstyle=\color{black},
%emph={MyClass,__init__},
%emphstyle=\color{deepred},
numbers=none,                    
%numbersep=5pt,
%numberstyle=\scriptsize\color{gray},
frame=none,
breaklines=true,
breakatwhitespace=false,
tabsize=2,
showstringspaces=false,
backgroundcolor = \color{background}
}}

% Generic code environment
\lstnewenvironment{codesty}[1][]
{
\codestyle
\lstset{#1}
}
{}

% Generic code for external files
\newcommand\codeexternal[2][]{{
\codestyle
\lstinputlisting[#1]{#2}}}

% Generic code for inline
\newcommand\codeinline[1]{{\codestyle\lstinline!#1!}}

% Python style for highlighting
\newcommand\pythonstyle{\lstset{
language=Python,
basicstyle=\footnotesize\ttfamily,
commentstyle=\color{red},
stringstyle=\color{deepgreen},
keywordstyle=\bfseries\color{orange},
identifierstyle=\color{black},
%emphstyle=\color{purple},
otherkeywords={self},
emph={MyClass,__init__,range,str,enumerate,print,len},
numbers=none,
numbersep=5pt,
numberstyle=\scriptsize\color{gray},
frame=none,
breaklines=true,
tabsize=2,
showstringspaces=false,
backgroundcolor = \color{background}
}}

% Python environment
\lstnewenvironment{python}[1][]
{
\pythonstyle
\lstset{#1}
}
{}

% Python for external files
\newcommand\pythonexternal[2][]{{
\pythonstyle
\lstinputlisting[#1]{#2}}}

% Python for inline
\newcommand\pythoninline[1]{{\pythonstyle\lstinline!#1!}}

% Matlab style for highlighting
\newcommand\matlabstyle{\lstset{
language=MATLAB,
basicstyle=\footnotesize\ttfamily,
commentstyle=\color{deepgreen},
otherkeywords={whichever},
keywordstyle=\bfseries\color{blue},
stringstyle=\color{magenta},
%emph={MyClass,__init__},
emphstyle=\color{deepred},
numbers=none,                    
%numbersep=5pt,
%numberstyle=\scriptsize\color{gray},
frame=none,
breaklines=true,
tabsize=2,
showstringspaces=false,
backgroundcolor = \color{background}
}}

% Matlab environment
\lstnewenvironment{MATLAB}[1][]
{
\matlabstyle
\lstset{#1}
}
{}

% Matlab for external files
\newcommand\matlabexternal[2][]{{
\matlabstyle
\lstinputlisting[#1]{#2}}}

% Matlab for inline
\newcommand\matlabinline[1]{{\matlabstyle\lstinline!#1!}}

% load a bunch of packages needed
\usepackage{moreverb,url}
\usepackage[colorlinks,bookmarksopen,bookmarksnumbered,citecolor=blue,urlcolor=blue]{hyperref}
\usepackage{color}
\usepackage{graphicx}
\usepackage{bm}
\usepackage[english]{babel}
\usepackage[utf8]{inputenc}
\usepackage{amsmath,mathtools}
\usepackage{amssymb}
\usepackage{natbib}
\usepackage{float}
\usepackage{xspace}
\usepackage{emojiCommands}
\usepackage{multirow}
\usepackage{hhline}
\usepackage{gensymb}
\usepackage[version=4]{mhchem}
\usepackage{blindtext}
\usepackage{enumitem}
\usepackage{upgreek}

\usepackage{array}   % for \newcolumntype macro
\newcolumntype{L}{>{$}l<{$}} % math-mode version of "l" column type

\definecolor{dark-gray}{gray}{0.5}
\newcommand{\question}[1]{\emph{\textcolor{dark-gray}{#1}} \\}
\definecolor{light-gray}{gray}{0.95}
%\newcommand{\code}[1]{\texttt{#1}}
\newcommand{\code}[1]{\colorbox{light-gray}{\texttt{#1}}}
\newcommand{\red}[1]{{\bf \textcolor{red}{#1}}}
\newcommand{\green}[1]{{\bf \textcolor{green}{#1}}}
\newcommand{\laplace}{\bm{\nabla}}
\newcommand{\Var}{\mathrm{Var}}
\newcommand{\aone}{\ensuremath{\mathcal{A}_1}\xspace}
\newcommand{\atwo}{\ensuremath{\mathcal{A}_2}\xspace}

% New command for manual numbering
\newcommand\numberthis{\addtocounter{equation}{1}\tag{\theequation}}
% No indentation for now
\newcommand{\norm}[1]{\left\lvert#1\right\rvert}
\setlength\parindent{0pt}

\renewcommand\thesubsection{\thesection.\alph{subsection}}
\renewcommand\thesubsubsection{\thesection.\alph{subsection}.\roman{subsubsection}}

\newif\ifelectronic
\electronictrue