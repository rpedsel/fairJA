set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.4551, <2> 26.8735, <3> 26.0777, <4> 19.2575, <5> 23.7713, <6> 24.529, <7> 23.3983, <8> 24.8285, <9> 17.902, <10> 21.5449, <11> 21.806, <12> 16.8295, <13> 29.589, <14> 21.5108, <15> 19.6243, <16> 14.6112, <17> 26.2867, <18> 23.5077, <19> 25.6193, <20> 31.2264;
param workload[JOB] := <1> 5.6969, <2> 5.184, <3> 5.1066, <4> 4.3883, <5> 4.8756, <6> 4.9527, <7> 4.8372, <8> 4.9828, <9> 4.2311, <10> 4.6416, <11> 4.6697, <12> 4.1024, <13> 5.4396, <14> 4.638, <15> 4.4299, <16> 3.8225, <17> 5.1271, <18> 4.8485, <19> 5.0616, <20> 5.5881;
param capacity[MACHINE] := <1> 10.3526, <2> 10.3526, <3> 10.3526, <4> 10.3526, <5> 10.3526, <6> 10.3526, <7> 10.3526;

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
