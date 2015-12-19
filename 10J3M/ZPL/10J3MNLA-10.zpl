set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.4958, <2> 34.3735, <3> 21.3643, <4> 16.4539, <5> 27.6422, <6> 27.5403, <7> 24.8421, <8> 28.5296, <9> 20.979, <10> 27.2154;
param workload[JOB] := <1> 506.061, <2> 1181.5375, <3> 456.4333, <4> 270.7308, <5> 764.0912, <6> 758.4681, <7> 617.1299, <8> 813.9381, <9> 440.1184, <10> 740.678;
param capacity[MACHINE] := <1> 2183.0621, <2> 2183.0621, <3> 2183.0621;

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
