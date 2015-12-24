set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.5387, <2> 44.6152, <3> 2.8802, <4> 48.1933, <5> 44.8322, <6> 37.462, <7> 22.6985, <8> 13.5274, <9> 37.9347, <10> 14.5008;
param workload[JOB] := <1> 14.5387, <2> 44.6152, <3> 2.8802, <4> 48.1933, <5> 44.8322, <6> 37.462, <7> 22.6985, <8> 13.5274, <9> 37.9347, <10> 14.5008;
param capacity[MACHINE] := <1> 70.2958, <2> 70.2958, <3> 70.2958;

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
