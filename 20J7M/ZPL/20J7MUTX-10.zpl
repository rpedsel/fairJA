set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 48.4354, <2> 35.4301, <3> 31.7227, <4> 6.451, <5> 39.6924, <6> 31.4361, <7> 31.487, <8> 31.4752, <9> 8.6393, <10> 8.2085, <11> 38.4291, <12> 2.238, <13> 13.9287, <14> 17.5865, <15> 2.515, <16> 11.2733, <17> 12.1176, <18> 7.2307, <19> 15.9466, <20> 40.9829;
param workload[JOB] := <1> 6.9596, <2> 5.9523, <3> 5.6323, <4> 2.5399, <5> 6.3002, <6> 5.6068, <7> 5.6113, <8> 5.6103, <9> 2.9393, <10> 2.865, <11> 6.1991, <12> 1.496, <13> 3.7321, <14> 4.1936, <15> 1.5859, <16> 3.3576, <17> 3.481, <18> 2.689, <19> 3.9933, <20> 6.4018;
param capacity[MACHINE] := <1> 9.3371, <2> 9.3371, <3> 9.3371, <4> 9.3371, <5> 9.3371, <6> 9.3371, <7> 9.3371;

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
