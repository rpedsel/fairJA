set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 36.4073, <2> 22.4485, <3> 31.9406, <4> 35.5961, <5> 25.5672, <6> 22.6183, <7> 28.1884, <8> 22.3331, <9> 17.8125, <10> 26.8741, <11> 31.4556, <12> 30.8467, <13> 22.959, <14> 28.7265, <15> 28.8417, <16> 30.1569, <17> 26.4163, <18> 25.4906, <19> 34.2334, <20> 21.2024;
param workload[JOB] := <1> 6.0338, <2> 4.738, <3> 5.6516, <4> 5.9662, <5> 5.0564, <6> 4.7559, <7> 5.3093, <8> 4.7258, <9> 4.2205, <10> 5.184, <11> 5.6085, <12> 5.554, <13> 4.7916, <14> 5.3597, <15> 5.3704, <16> 5.4915, <17> 5.1397, <18> 5.0488, <19> 5.8509, <20> 4.6046;
param capacity[MACHINE] := <1> 14.923, <2> 14.923, <3> 14.923, <4> 14.923, <5> 14.923, <6> 14.923, <7> 14.923;

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
