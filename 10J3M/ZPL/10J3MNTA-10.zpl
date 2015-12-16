set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.1524, <2> 21.8602, <3> 34.0189, <4> 27.1732, <5> 28.3556, <6> 19.3879, <7> 21.3327, <8> 29.1792, <9> 14.1752, <10> 26.8634;
param workload[JOB] := <1> 406.1192, <2> 477.8683, <3> 1157.2856, <4> 738.3828, <5> 804.0401, <6> 375.8907, <7> 455.0841, <8> 851.4257, <9> 200.9363, <10> 721.6423;
param capacity[MACHINE] := <1> 1547.1688, <2> 1547.1688, <3> 1547.1688;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
