set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.7353, <2> 18.4144, <3> 30.0571, <4> 27.9313, <5> 39.1774, <6> 24.2245, <7> 0.0046, <8> 13.8794, <9> 41.3818, <10> 29.2176;
param workload[JOB] := <1> 2001.2471, <2> 339.0901, <3> 903.4293, <4> 780.1575, <5> 1534.8687, <6> 586.8264, <7> 0.0, <8> 192.6377, <9> 1712.4534, <10> 853.6681;
param capacity[MACHINE] := <1> 2226.0946, <2> 2226.0946, <3> 2226.0946;

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
