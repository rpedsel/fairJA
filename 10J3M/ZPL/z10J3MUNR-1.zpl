set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 48.1537, <2> 40.4052, <3> 25.6957, <4> 15.8029, <5> 27.5267, <6> 32.4382, <7> 11.665, <8> 43.3216, <9> 20.9931, <10> 2.1006;
param workload[JOB] := <1> 34.8538, <2> 16.098, <3> 46.9563, <4> 5.5967, <5> 11.9528, <6> 49.1678, <7> 27.0367, <8> 15.9865, <9> 37.9883, <10> 44.0188;
param capacity[MACHINE] := <1> 289.6557, <2> 289.6557, <3> 289.6557;

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
