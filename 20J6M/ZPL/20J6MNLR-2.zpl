set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.6105, <2> 21.7363, <3> 22.0955, <4> 20.1234, <5> 28.4574, <6> 30.6432, <7> 18.1373, <8> 30.8507, <9> 26.1516, <10> 21.4801, <11> 27.4836, <12> 32.435, <13> 19.8468, <14> 29.2165, <15> 17.5398, <16> 24.8353, <17> 23.0615, <18> 27.6609, <19> 15.7382, <20> 27.5343;
param workload[JOB] := <1> 45.5128, <2> 8.1959, <3> 11.8571, <4> 48.0033, <5> 24.7173, <6> 34.0869, <7> 6.152, <8> 5.4985, <9> 6.4893, <10> 21.1703, <11> 18.9254, <12> 48.12, <13> 14.5398, <14> 36.6716, <15> 35.8632, <16> 2.7696, <17> 16.2546, <18> 39.6914, <19> 28.1852, <20> 34.4028;
param capacity[MACHINE] := <1> 81.1845, <2> 81.1845, <3> 81.1845, <4> 81.1845, <5> 81.1845, <6> 81.1845;

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
