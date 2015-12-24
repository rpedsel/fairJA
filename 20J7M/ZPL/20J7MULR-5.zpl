set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.7502, <2> 22.4947, <3> 0.4759, <4> 31.3219, <5> 1.1428, <6> 23.8543, <7> 30.0821, <8> 24.4631, <9> 4.8122, <10> 13.9351, <11> 24.1229, <12> 31.3508, <13> 8.1759, <14> 49.555, <15> 16.1762, <16> 22.0945, <17> 32.8546, <18> 14.5829, <19> 39.0594, <20> 48.9096;
param workload[JOB] := <1> 5.442, <2> 47.5674, <3> 30.6104, <4> 28.2031, <5> 1.1861, <6> 35.5036, <7> 8.934, <8> 13.8363, <9> 35.3075, <10> 31.0882, <11> 5.5996, <12> 22.9315, <13> 45.4659, <14> 36.5243, <15> 10.7878, <16> 38.7184, <17> 15.8136, <18> 27.7773, <19> 19.1481, <20> 21.0071;
param capacity[MACHINE] := <1> 68.7789, <2> 68.7789, <3> 68.7789, <4> 68.7789, <5> 68.7789, <6> 68.7789, <7> 68.7789;

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
