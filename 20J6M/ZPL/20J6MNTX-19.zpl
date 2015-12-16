set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.816, <2> 28.4692, <3> 29.0487, <4> 20.2595, <5> 28.1869, <6> 26.9499, <7> 31.5639, <8> 26.7624, <9> 17.4084, <10> 27.8236, <11> 26.9861, <12> 16.6879, <13> 27.651, <14> 26.841, <15> 15.4224, <16> 24.5372, <17> 34.3787, <18> 17.2726, <19> 31.4927, <20> 22.6707;
param workload[JOB] := <1> 4.9816, <2> 5.3357, <3> 5.3897, <4> 4.5011, <5> 5.3091, <6> 5.1913, <7> 5.6182, <8> 5.1732, <9> 4.1723, <10> 5.2748, <11> 5.1948, <12> 4.0851, <13> 5.2584, <14> 5.1808, <15> 3.9271, <16> 4.9535, <17> 5.8633, <18> 4.156, <19> 5.6118, <20> 4.7614;
param capacity[MACHINE] := <1> 12.4924, <2> 12.4924, <3> 12.4924, <4> 12.4924, <5> 12.4924, <6> 12.4924;

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
