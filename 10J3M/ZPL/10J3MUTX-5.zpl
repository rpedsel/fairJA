set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.7479, <2> 3.1151, <3> 17.6829, <4> 6.2575, <5> 27.9299, <6> 44.382, <7> 7.8798, <8> 23.547, <9> 27.3852, <10> 45.6781;
param workload[JOB] := <1> 6.6894, <2> 1.765, <3> 4.2051, <4> 2.5015, <5> 5.2849, <6> 6.662, <7> 2.8071, <8> 4.8525, <9> 5.2331, <10> 6.7586;
param capacity[MACHINE] := <1> 11.6898, <2> 11.6898, <3> 11.6898;

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
