set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.3587, <2> 18.3666, <3> 23.5855, <4> 14.006, <5> 26.8306, <6> 27.7531, <7> 14.3887, <8> 25.0231, <9> 26.7135, <10> 30.745;
param workload[JOB] := <1> 18.9923, <2> 11.1702, <3> 47.209, <4> 23.5531, <5> 27.3443, <6> 29.94, <7> 13.4922, <8> 25.5139, <9> 35.3627, <10> 7.8437;
param capacity[MACHINE] := <1> 60.1054, <2> 60.1054, <3> 60.1054;

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
