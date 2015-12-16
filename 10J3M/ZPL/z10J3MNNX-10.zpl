set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.3454, <2> 21.288, <3> 15.6519, <4> 35.3063, <5> 28.7887, <6> 19.5156, <7> 22.6469, <8> 17.8378, <9> 19.4155, <10> 21.9104;
param workload[JOB] := <1> 4.5106, <2> 4.6139, <3> 3.9562, <4> 5.9419, <5> 5.3655, <6> 4.4176, <7> 4.7589, <8> 4.2235, <9> 4.4063, <10> 4.6809;
param capacity[MACHINE] := <1> 46.8753, <2> 46.8753, <3> 46.8753;

var x[JM] binary;
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
