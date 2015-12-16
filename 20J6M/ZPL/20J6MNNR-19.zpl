set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.074, <2> 32.1861, <3> 26.1004, <4> 28.7569, <5> 24.7686, <6> 24.8494, <7> 27.5746, <8> 32.2424, <9> 28.8369, <10> 26.6785, <11> 27.5215, <12> 26.355, <13> 24.4853, <14> 32.8594, <15> 25.0242, <16> 28.5165, <17> 21.9951, <18> 35.6579, <19> 19.8271, <20> 23.5618;
param workload[JOB] := <1> 43.0428, <2> 22.7032, <3> 35.2732, <4> 1.4241, <5> 32.3143, <6> 25.2344, <7> 14.9605, <8> 8.7641, <9> 40.6348, <10> 30.5176, <11> 11.2452, <12> 46.1333, <13> 48.8585, <14> 36.1978, <15> 34.2864, <16> 37.8106, <17> 4.7885, <18> 17.8825, <19> 22.931, <20> 20.3893;
param capacity[MACHINE] := <1> 535.3921, <2> 535.3921, <3> 535.3921, <4> 535.3921, <5> 535.3921, <6> 535.3921;

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
