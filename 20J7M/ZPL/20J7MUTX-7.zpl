set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.864, <2> 47.8273, <3> 1.0396, <4> 4.4776, <5> 39.8239, <6> 49.4474, <7> 28.428, <8> 30.212, <9> 26.1253, <10> 25.9329, <11> 14.1784, <12> 44.5179, <13> 21.5595, <14> 0.7276, <15> 15.7799, <16> 7.2703, <17> 49.6733, <18> 41.3086, <19> 32.9748, <20> 13.5193;
param workload[JOB] := <1> 3.4444, <2> 6.9157, <3> 1.0196, <4> 2.116, <5> 6.3106, <6> 7.0319, <7> 5.3318, <8> 5.4965, <9> 5.1113, <10> 5.0924, <11> 3.7654, <12> 6.6722, <13> 4.6432, <14> 0.853, <15> 3.9724, <16> 2.6963, <17> 7.0479, <18> 6.4272, <19> 5.7424, <20> 3.6769;
param capacity[MACHINE] := <1> 10.0037, <2> 10.0037, <3> 10.0037, <4> 10.0037, <5> 10.0037, <6> 10.0037, <7> 10.0037;

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
