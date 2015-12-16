set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.3303, <2> 21.9192, <3> 16.6096, <4> 29.2013, <5> 28.111, <6> 19.8657, <7> 29.0267, <8> 15.9089, <9> 14.1338, <10> 24.1143, <11> 25.7887, <12> 24.1686, <13> 17.2408, <14> 25.3392, <15> 25.7172, <16> 21.3889, <17> 23.4155, <18> 17.0379, <19> 25.5619, <20> 24.7216;
param workload[JOB] := <1> 36.4541, <2> 36.5591, <3> 13.5528, <4> 40.4984, <5> 42.7045, <6> 21.3931, <7> 35.6794, <8> 36.9266, <9> 37.2244, <10> 31.2079, <11> 8.8928, <12> 36.2867, <13> 44.272, <14> 3.4253, <15> 24.7857, <16> 9.6993, <17> 11.0949, <18> 34.131, <19> 13.6248, <20> 14.3632;
param capacity[MACHINE] := <1> 532.776, <2> 532.776, <3> 532.776, <4> 532.776, <5> 532.776, <6> 532.776;

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
