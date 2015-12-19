set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.1474, <2> 4.7168, <3> 42.7425, <4> 39.8661, <5> 30.2309, <6> 40.8584, <7> 3.2722, <8> 7.2578, <9> 21.5618, <10> 18.3247;
param workload[JOB] := <1> 26.1053, <2> 5.7647, <3> 18.1524, <4> 7.5973, <5> 28.8029, <6> 40.7183, <7> 30.9481, <8> 17.6209, <9> 32.8256, <10> 18.9737;
param capacity[MACHINE] := <1> 56.8773, <2> 56.8773, <3> 56.8773;

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
