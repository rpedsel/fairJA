set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.1158, <2> 19.0734, <3> 20.9531, <4> 30.6716, <5> 30.4608, <6> 16.3385, <7> 25.3564, <8> 30.1112, <9> 25.4605, <10> 28.3671, <11> 23.2186, <12> 25.0278, <13> 24.6351, <14> 24.8958, <15> 22.1849, <16> 22.4778, <17> 17.9627, <18> 23.0918, <19> 28.1687, <20> 26.0362;
param workload[JOB] := <1> 12.2274, <2> 44.1517, <3> 44.5059, <4> 26.7648, <5> 43.1468, <6> 11.9691, <7> 32.8212, <8> 38.1746, <9> 38.6178, <10> 3.3609, <11> 19.2677, <12> 27.6819, <13> 31.9204, <14> 31.6696, <15> 4.5345, <16> 12.6644, <17> 9.4483, <18> 23.4869, <19> 25.2774, <20> 30.6997;
param capacity[MACHINE] := <1> 54.899, <2> 54.899, <3> 54.899, <4> 54.899, <5> 54.899, <6> 54.899, <7> 54.899;

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
