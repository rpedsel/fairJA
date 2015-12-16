set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.0334, <2> 20.8887, <3> 19.2342, <4> 20.3021, <5> 30.1446, <6> 17.4652, <7> 27.0131, <8> 25.9633, <9> 25.8718, <10> 22.6296;
param workload[JOB] := <1> 626.6711, <2> 436.3378, <3> 369.9544, <4> 412.1753, <5> 908.6969, <6> 305.0332, <7> 729.7076, <8> 674.0929, <9> 669.35, <10> 512.0988;
param capacity[MACHINE] := <1> 1881.3727, <2> 1881.3727, <3> 1881.3727;

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
