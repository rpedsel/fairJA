set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.0566, <2> 29.6115, <3> 0.124, <4> 25.4688, <5> 15.1923, <6> 0.1286, <7> 17.0728, <8> 1.5694, <9> 48.3147, <10> 32.3716;
param workload[JOB] := <1> 257.8144, <2> 876.8409, <3> 0.0154, <4> 648.6598, <5> 230.806, <6> 0.0165, <7> 291.4805, <8> 2.463, <9> 2334.3102, <10> 1047.9205;
param capacity[MACHINE] := <1> 1896.7757, <2> 1896.7757, <3> 1896.7757;

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
