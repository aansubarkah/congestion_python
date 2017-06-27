#!/usr/bin/env python
grammars = {}

# Default
grammars[0] = []
grammardefault = [
    "{<NN.?>*<\.>*<-.?>*<IN.?>*<RB.?>*<NN.?>+<VB.?|RB|MD|CD|DC>*<JJ>+}", # chunk
    "}<VB.?|MD|CD|DC|RB>+{" # chink
]
grammars[0].append(grammardefault)

# @SbyTrafficServ
grammars[203740486] = []
grammarsbytrafficserv1 = [
    "{<NN.?>*<\.>*<-.?>*<IN.?>*<RB.?>*<NN.?>+<VB.?|RB|MD|CD|DC>*<JJ>+}", # chunk
    "}<VB.?|MD|CD|DC|RB>+{" # chink
]
grammars[203740486].append(grammarsbytrafficserv1)

# @TMCPoldaMetro
grammars[76647722] = []
grammartmcpoldametro1 = [
    "{<NN.?>*<RB|IN|,>*<NN.?>+<VB|MD|RB|-->*<JJ>+}", # chunk
    "}<VB.?|RB|MD>+{" # chink
]
grammars[76647722].append(grammartmcpoldametro1)

# @PTJASAMARGA
grammars[540625251] = []
grammarptjasamarga1 = [
    "{<NN.?>+<NN.?|--|CC>*<NN.?><JJ>+}",
    "}<CC>{"
]
grammars[540625251].append(grammarptjasamarga1)

# @SenkomCMNP
grammars[1445782526] = []
grammarsencomcmnp = [
    "{<NN.?>+<NN.?|--|CD|CC|,|IN>*<NN.?><RB|PRP|MD>*<JJ>+}",
    "}<RB|PRP|MD|CC>{"
]
grammars[1445782526].append(grammarsencomcmnp)

# @tol_mms
grammars[310179866] = []
grammarmargamandalasakti = [
    "{<NN.?>+<RB|PRP|IN|-->*<NN.?>*<RB|PRP|MD>*<JJ>+}",
    "}<PRP|MD>{"
]
grammars[310179866].append(grammarmargamandalasakti)

# @RadioElshinta
grammars[121640063] = []
grammarradioelshinta = [
    "{<JJ>*<IN|RB|-->*<NN.?>+<RB|,>*<NN.?>*<JJ>*}",
    "}<RB|,>{"
]
grammars[121640063].append(grammarradioelshinta)

# @RTMCJatim
grammars[125832312] = []
grammarrtmcjatim = [
    "{<NN.?>+<IN|RB>*<NN.?>+<VB|RB|,>*<JJ>+}",
    "}<RB|VB|,|IN>{"
]
grammars[125832312].append(grammarrtmcjatim)

# @TMC_PolresCimahi
grammars[4777183652] = []
grammartmccimahi = [
    "{<NN.?><\.>*<NN.?>+<VB|CD|RB>*<NN.?>*<VB|>*<JJ>+}",
    "}<VB|RB>{"
]
grammars[4777183652].append(grammartmccimahi)


#print("Seluruh Dict:")
#print(grammars)
#
#kode = int(input("Masukkan Kode: "))
#if kode in grammars:
#    print(grammars[kode])
#
#    for v in grammars[kode]:
#        print(v[0] + ' chunk')
#        print(v[1] + ' chink')
#else:
#    print(grammars[0])
