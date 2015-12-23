set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.2551, <2> 17.4355, <3> 7.2936, <4> 49.8918, <5> 6.2553, <6> 13.8304, <7> 39.0938, <8> 8.7084, <9> 14.2611, <10> 18.9573, <11> 28.3012, <12> 10.0307, <13> 6.6485, <14> 13.3363, <15> 18.9633, <16> 27.7198, <17> 1.3749, <18> 17.0463, <19> 0.5443, <20> 32.0741;
param workload[JOB] := <1> 6.6525, <2> 4.1756, <3> 2.7007, <4> 7.0634, <5> 2.5011, <6> 3.7189, <7> 6.2525, <8> 2.951, <9> 3.7764, <10> 4.354, <11> 5.3199, <12> 3.1671, <13> 2.5785, <14> 3.6519, <15> 4.3547, <16> 5.265, <17> 1.1726, <18> 4.1287, <19> 0.7378, <20> 5.6634;
param capacity[MACHINE] := <1> 8.5913, <2> 8.5913, <3> 8.5913, <4> 8.5913, <5> 8.5913, <6> 8.5913, <7> 8.5913;

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
