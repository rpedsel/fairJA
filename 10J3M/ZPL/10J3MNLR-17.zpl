set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.5044, <2> 32.3198, <3> 17.5844, <4> 19.4809, <5> 37.4372, <6> 26.1422, <7> 21.0806, <8> 25.8239, <9> 19.1745, <10> 28.6329;
param workload[JOB] := <1> 36.7954, <2> 23.8691, <3> 30.9938, <4> 31.9984, <5> 8.7315, <6> 25.8772, <7> 47.6005, <8> 0.6653, <9> 4.1765, <10> 40.1542;
param capacity[MACHINE] := <1> 83.6206, <2> 83.6206, <3> 83.6206;

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
