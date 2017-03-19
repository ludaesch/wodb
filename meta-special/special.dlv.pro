% prop(F,P,V) - figure F has property P with value V
prop(f1,style,bold).
prop(f1,size,large).
prop(f1,color,red).
prop(f1,shape,square).

prop(f2,style,thin).
prop(f2,size,large).
prop(f2,color,red).
prop(f2,shape,square).

prop(f3,style,bold).
prop(f3,size,large).
prop(f3,color,red).
prop(f3,shape,circle).

prop(f4,style,bold).
prop(f4,size,large).
prop(f4,color,green).
prop(f4,shape,square).

prop(f5,style,bold).
prop(f5,size,small).
prop(f5,color,red).
prop(f5,shape,square).

isFig(F)  :- prop(F,_,_).  % F is a figure
isProp(P) :- prop(_,P,_).  % P is a property 
isVal(V)  :- prop(_,_,V).  % V is a value

% property P has value V how many times? N times!
propValN(P,V,N) :-
    isProp(P), isVal(V),
    #count{ F : prop(F,P,V) } = N,
    N > 0.

% value V of property P is special since it's more rare than another value V1
specialProp(P,V) :- propValN(P,V,N), propValN(P,V1,N1), N < N1.

% figure F is special wrt property P
specialFigProp(F,P) :- specialProp(P,V), prop(F,P,V).

% figure F is special wrt some property
specialFig(F) :- specialFigProp(F,_).

% figure F is not special (wrt any property)
% ... which is the distinguishing "meta-property"
% ... making F special in *that* sense !!
notSpecial(F) :- isFig(F),  not specialFig(F).


    
