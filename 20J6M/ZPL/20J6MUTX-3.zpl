set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 48.0779, <2> 37.7737, <3> 15.876, <4> 28.7407, <5> 49.7046, <6> 20.2228, <7> 20.2336, <8> 23.955, <9> 25.9664, <10> 0.0723, <11> 33.5676, <12> 24.9573, <13> 35.2956, <14> 24.4842, <15> 11.9481, <16> 9.0509, <17> 15.2606, <18> 11.8825, <19> 45.5143, <20> 31.0667;
param workload[JOB] := <1> 6.9338, <2> 6.146, <3> 3.9845, <4> 5.361, <5> 7.0501, <6> 4.497, <7> 4.4982, <8> 4.8944, <9> 5.0957, <10> 0.2689, <11> 5.7938, <12> 4.9957, <13> 5.941, <14> 4.9482, <15> 3.4566, <16> 3.0085, <17> 3.9065, <18> 3.4471, <19> 6.7464, <20> 5.5738;
param capacity[MACHINE] := <1> 12.0684, <2> 12.0684, <3> 12.0684, <4> 12.0684, <5> 12.0684, <6> 12.0684;

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
