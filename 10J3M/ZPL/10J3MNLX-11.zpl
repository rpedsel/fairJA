set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.4699, <2> 26.5952, <3> 27.3833, <4> 15.1957, <5> 32.7864, <6> 30.7434, <7> 36.2941, <8> 18.7768, <9> 18.7209, <10> 29.1726;
param workload[JOB] := <1> 5.2412, <2> 5.1571, <3> 5.2329, <4> 3.8982, <5> 5.7259, <6> 5.5447, <7> 6.0245, <8> 4.3332, <9> 4.3268, <10> 5.4012;
param capacity[MACHINE] := <1> 16.9619, <2> 16.9619, <3> 16.9619;

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
