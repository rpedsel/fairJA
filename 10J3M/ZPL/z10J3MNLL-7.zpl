set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.6612, <2> 15.669, <3> 20.6584, <4> 27.7912, <5> 19.0945, <6> 19.1148, <7> 26.9978, <8> 25.0425, <9> 31.0135, <10> 26.5278;
param workload[JOB] := <1> 17.6612, <2> 15.669, <3> 20.6584, <4> 27.7912, <5> 19.0945, <6> 19.1148, <7> 26.9978, <8> 25.0425, <9> 31.0135, <10> 26.5278;
param capacity[MACHINE] := <1> 76.5236, <2> 76.5236, <3> 76.5236;

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
